#!/bin/sh
# Prunes unused images from Podman's default store weekly. Bound images live in
# the bootc store, which this doesn't touch.
set -eu
d=$(dirname "$0")

cp -R "$d/system_files/." /

systemctl enable podman-image-prune.timer
