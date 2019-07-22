#!/bin/bash

if [[ $# -ne 3 ]]; then
    >&2 echo "usage: ./run.sh img_tag mnt_dir password"
    exit 1
fi

img_tag="$1"
mnt_dir="$2"
password="$3"

date && time docker run \
             --rm \
             -p 8787:8787 \
             -v "${mnt_dir}":"${mnt_dir}" \
             -e ROOT=true \
             -e USER=ryan \
             -e PASSWORD="${password}" \
             mooreryan/stec_cattle_microbiome_16s:"${img_tag}"
