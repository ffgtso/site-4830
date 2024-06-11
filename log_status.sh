#!/bin/bash

if [ ! -e lfdtgtnr ]; then
    echo 1 >lfdtgtnr
fi

if [ ! -e lastbuildstart ]; then
    date +%s >lastbuildstart
fi
curtgt=$(cat lfdtgtnr)
last=$(cat lastbuildstart)
now=$(date +%s)
mins=$(expr ${now} - ${last})
mins=$(expr ${mins} / 60)
echo "$(printf "%2d: %-20s" ${curtgt} "$1") built with RC $2 at $(date), took $(printf "%2d" ${mins}) minutes" >> build_tmp/build-${RELEASE}.log
expr ${curtgt} + 1 >lfdtgtnr
