﻿##	gluon site.mk 4830.org
GLUON_DEPRECATED=upgrade
GLUON_MULTIDOMAIN=1

GLUON_FEATURES := \
        autoupdater \
        ebtables-filter-multicast \
        ebtables-filter-ra-dhcp \
        ebtables-limit-arp \
        mesh-batman-adv-15 \
        mesh-vpn-tunneldigger \
        radv-filterd \
        radvd \
        respondd \
        status-page \
        web-advanced \
        web-private-wifi \
        web-wizard
#        web-cellular \
##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/LEDE packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags

#
#        config-mode-geo-location-osm \
#

# -gluon-status-page
#ffac-status-page
# custom status page without contact information

GLUON_SITE_PACKAGES := \
    respondd-module-airtime \
    ffac-ssid-changer \
    ffac-autoupdater-wifi-fallback \
    ffgt-speedtest \
    ffgt-banner \
    ffgt-config-mode-wizard \
    ffgt-preserve-mods \
    gluon-tunneldigger-watchdog \
    gluon-alfred \
    gluon-multi-radio \
    ff-ap-timer \
    ffX-migrate-to-4830
#    gluon-pump \
#   ff-ap-timer \
#   ffgt-nachtruhe \

INCLUDE_FFGT_PACKAGES := \
    tcpdump \
    mtr-json \
    sipcalc \
    iwinfo

EXCLUDE_FFGT_PACKAGES := \
    -tcpdump \
    -mtr-json \
    -sipcalc \
    -iwinfo

# gluon-mesh-wireless-sae
GLUON_FEATURES_standard := wireless-encryption-wpa3

DEFAULT_GLUON_RELEASE := 1.6.0

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

DEFAULT_GLUON_CHECKOUT := v2022.1.4

GLUON_CHECKOUT ?= $(DEFAULT_GLUON_CHECKOUT)

GLUON_PRIORITY ?= 0

GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= de en

# Additional package list generated by contrib/genpkglist.py
INCLUDE_USB := \
    usbutils

EXCLUDE_USB := \
    -usbutils

INCLUDE_USB_HID := \
    kmod-usb-hid \
    kmod-hid-generic

EXCLUDE_USB_HID := \
    -kmod-usb-hid \
    -kmod-hid-generic

INCLUDE_USB_SERIAL := \
    kmod-usb-serial \
    kmod-usb-serial-ftdi \
    kmod-usb-serial-pl2303

EXCLUDE_USB_SERIAL := \
    -kmod-usb-serial \
    -kmod-usb-serial-ftdi \
    -kmod-usb-serial-pl2303

INCLUDE_USB_STORAGE := \
    block-mount \
    blkid \
    kmod-fs-ext4 \
    kmod-fs-ntfs \
    kmod-fs-vfat \
    kmod-usb-storage \
    kmod-usb-storage-extras \
    kmod-usb-storage-uas \
    kmod-nls-base \
    kmod-nls-cp1250 \
    kmod-nls-cp437 \
    kmod-nls-cp850 \
    kmod-nls-cp852 \
    kmod-nls-iso8859-1 \
    kmod-nls-iso8859-13 \
    kmod-nls-iso8859-15 \
    kmod-nls-iso8859-2 \
    kmod-nls-utf8

EXCLUDE_USB_STORAGE := \
    -block-mount \
    -blkid \
    -kmod-fs-ext4 \
    -kmod-fs-ntfs \
    -kmod-fs-vfat \
    -kmod-usb-storage \
    -kmod-usb-storage-extras \
    -kmod-usb-storage-uas \
    -kmod-nls-base \
    -kmod-nls-cp1250 \
    -kmod-nls-cp437 \
    -kmod-nls-cp850 \
    -kmod-nls-cp852 \
    -kmod-nls-iso8859-1 \
    -kmod-nls-iso8859-13 \
    -kmod-nls-iso8859-15 \
    -kmod-nls-iso8859-2 \
    -kmod-nls-utf8

INCLUDE_USB_NET := \
    kmod-mii \
    kmod-usb-net \
    kmod-usb-net-asix \
    kmod-usb-net-asix-ax88179 \
    kmod-usb-net-cdc-eem \
    kmod-usb-net-cdc-ether \
    kmod-usb-net-cdc-subset \
    kmod-usb-net-dm9601-ether \
    kmod-usb-net-hso \
    kmod-usb-net-ipheth \
    kmod-usb-net-mcs7830 \
    kmod-usb-net-pegasus \
    kmod-usb-net-rndis \
    kmod-usb-net-rtl8152 \
    kmod-usb-net-smsc95xx

EXCLUDE_USB_NET := \
    -kmod-mii \
    -kmod-usb-net \
    -kmod-usb-net-asix \
    -kmod-usb-net-asix-ax88179 \
    -kmod-usb-net-cdc-eem \
    -kmod-usb-net-cdc-ether \
    -kmod-usb-net-cdc-subset \
    -kmod-usb-net-dm9601-ether \
    -kmod-usb-net-hso \
    -kmod-usb-net-ipheth \
    -kmod-usb-net-mcs7830 \
    -kmod-usb-net-pegasus \
    -kmod-usb-net-rndis \
    -kmod-usb-net-rtl8152 \
    -kmod-usb-net-smsc95xx

INCLUDE_PCI := \
    pciutils

EXCLUDE_PCI := \
    -pciutils

INCLUDE_PCI_NET := \
    kmod-bnx2

EXCLUDE_PCI_NET := \
    -kmod-bnx2

INCLUDE_VIRT := \
    qemu-ga

EXCLUDE_VIRT := \
    -qemu-ga

INCLUDE_TLS := \
    ca-bundle \
    libustream-openssl \
    openssh-sftp-server

EXCLUDE_TLS := \
    -ca-bundle \
    -libustream-openssl \
    -openssh-sftp-server

ifeq ($(GLUON_TARGET),ath79-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_FFGT_PACKAGES)

    GLUON_devolo-wifi-pro-1750e_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-gl-ar150_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-gl-ar300m-lite_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-gl-ar750_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_joy-it-jt-or750i_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_netgear-wndr3700-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-a7-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c5-v1_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c7-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c7-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c59-v1_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr842n-v3_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr1043nd-v4_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr1043n-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_d-link-dir825b1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-re355-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-re450-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-plink-archer-c6-v2_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_ocedo-koala_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
endif

# no pkglists for target ath79-mikrotik


ifeq ($(GLUON_TARGET),ath79-nand)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2708)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2709)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2710)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2711)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),ipq40xx-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

# no pkglists for target ipq40xx-mikrotik


ifeq ($(GLUON_TARGET),ipq806x-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),lantiq-xrx200)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

    GLUON_avm-fritz-box-7412_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-td-w8970_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-td-w8980_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),lantiq-xway)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),mediatek-mt7622)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

    GLUON_ubiquiti-unifi-6-lr-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),mpc85xx-p1010)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),mpc85xx-p1020)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),mvebu-cortexa9)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),ramips-mt7620)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

    GLUON_tp-link-archer-c50-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-archer-c20i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-archer-c20-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_tp-link-archer-c2-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_netgear-ex3700_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_nexx-wt3020-8m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),ramips-mt7621)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)

    GLUON_netgear-ex6150_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_ubiquiti-edgerouter-x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
    GLUON_ubiquiti-edgerouter-x-sfp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE) $(EXCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),ramips-mt76x8)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_FFGT_PACKAGES)

    GLUON_gl-mt300n-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-microuter-n300_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_netgear-r6120_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_ravpower-rp-wd009_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-re305_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),rockchip-armv8)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),sunxi-cortexa7)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-64)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_VIRT) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-geode)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE) $(INCLUDE_FFGT_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-legacy)
    GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_FFGT_PACKAGES)
endif
