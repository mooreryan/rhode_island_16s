#!/bin/bash

if [[ $# -ne 3 ]]; then
    >&2 echo "usage: ./run.sh img_tag mnt_dir num_threads"
    exit 1
fi

img_tag="$1"
mnt_dir="$2"
num_threads="$3"

date && time docker run \
             --rm \
             -v "${mnt_dir}":"${mnt_dir}" \
             -e ROOT=true \
             -e USER=ryan \
             mooreryan/stec_cattle_microbiome_16s:"${img_tag}" \
             Rscript "${mnt_dir}"/scripts/make_asv_table.R "${mnt_dir}" "${num_threads}"
