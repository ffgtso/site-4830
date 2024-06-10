GLUON_BUILD_DIR := gluon-build
GLUON_GIT_URL := https://github.com/freifunk-gluon/gluon.git
GLUON_GIT_REF := v2022.1.4

PATCH_DIR := ${GLUON_BUILD_DIR}/site/patches
SECRET_KEY_FILE ?= ${HOME}/.gluon-secret-key
OPKG_KEY_BUILD_DIR ?= ${HOME}/.key-build

GLUON_TARGETS ?= $(shell cat targets | tr '\n' ' ')
GLUON_AUTOUPDATER_BRANCH := stable
GLUON_AUTOUPDATER_ENABLED := 1

#ifneq (,$(shell git describe --exact-match --tags 2>/dev/null))
#	GLUON_AUTOUPDATER_ENABLED := 1
#	GLUON_RELEASE := $(shell git describe --tags 2>/dev/null)
#else
#	GLUON_AUTOUPDATER_ENABLED := 1
#	EXP_FALLBACK = $(shell date '+%Y%m%d')
#	BUILD_NUMBER ?= $(EXP_FALLBACK)
#	GLUON_RELEASE := $(shell git describe --tags)~exp$(BUILD_NUMBER)
#endif

GLUON_RELEASE := 1.6.1~$(shell cat buildnr.txt)

JOBS ?= $(shell cat /proc/cpuinfo | grep processor | wc -l)

GLUON_MAKE := ${MAKE} -j ${JOBS} --no-print-directory -C ${GLUON_BUILD_DIR} \
    BROKEN=1 \
	GLUON_RELEASE=${GLUON_RELEASE} \
	GLUON_AUTOUPDATER_BRANCH=${GLUON_AUTOUPDATER_BRANCH} \
	GLUON_AUTOUPDATER_ENABLED=${GLUON_AUTOUPDATER_ENABLED}

all: info
	${MAKE} manifest

info:
	@echo
	@echo '#########################'
	@echo '# 4830.org Firmware build'
	@echo '# Building release ${GLUON_RELEASE} for branch ${GLUON_AUTOUPDATER_BRANCH}'
	@echo

build: gluon-prepare
	./bumpnumber.sh buildnr.txt
	cp OPKG_KEY_BUILD_DIR/* ${GLUON_BUILD_DIR}/openwrt || true
	for target in ${GLUON_TARGETS}; do \
		echo ""Building target $$target""; \
		${GLUON_MAKE} download all GLUON_TARGET="$$target" CONFIG_JSON_ADD_IMAGE_INFO=1; \
	done
	mkdir -p ${GLUON_BUILD_DIR}/output/opkg-packages
	cp -r ${GLUON_BUILD_DIR}/openwrt/bin/packages ${GLUON_BUILD_DIR}/output/opkg-packages/gluon-ffac-${GLUON_RELEASE}/

manifest: build
	for branch in experimental beta stable; do \
		${GLUON_MAKE} manifest GLUON_AUTOUPDATER_BRANCH=$$branch;\
	done
	mv -f ${GLUON_BUILD_DIR}/output/* ./output/

sign: manifest
	${GLUON_BUILD_DIR}/contrib/sign.sh ${SECRET_KEY_FILE} output/images/sysupgrade/${GLUON_AUTOUPDATER_BRANCH}.manifest

${GLUON_BUILD_DIR}:
	git clone ${GLUON_GIT_URL} ${GLUON_BUILD_DIR}

gluon-prepare: output-clean ${GLUON_BUILD_DIR}
	cd ${GLUON_BUILD_DIR} \
		&& git remote set-url origin ${GLUON_GIT_URL} \
		&& git fetch --tags origin ${GLUON_GIT_REF} \
		&& rm -rf packages \
		&& git checkout -q --force ${GLUON_GIT_REF} \
		&& git clean -fd;
	ln -sfT .. ${GLUON_BUILD_DIR}/site
	make gluon-patch
	${GLUON_MAKE} update

gluon-patch:
	echo "Applying Patches ..."
	(cd ${GLUON_BUILD_DIR})
			if [ `git branch --list patched` ]; then \
				(git branch -D patched) \
			fi
	(cd ${GLUON_BUILD_DIR}; git checkout -B patching)
	if [ -d "gluon-build/site/patches" -a "gluon-build/site/patches/*.patch" ]; then \
		(cd ${GLUON_BUILD_DIR}; git apply --ignore-space-change --ignore-whitespace --whitespace=nowarn --verbose site/patches/*.patch) || ( \
			cd ${GLUON_BUILD_DIR}; \
			git clean -fd; \
			git checkout -B patched; \
			git branch -D patching; \
			exit 1 \
		) \
	fi
	(cd ${GLUON_BUILD_DIR}; git branch -M patched)

gluon-clean:
	rm -rf ${GLUON_BUILD_DIR}

output-clean:
	mkdir -p output/
	rm -rf output/*

clean: gluon-clean output-clean
