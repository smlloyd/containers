#!/bin/sh
# Logs bootc in to GHCR at boot with GHCR_USERNAME/GHCR_TOKEN from Doppler, so
# hosts can pull private images. Host-specific ordering belongs in a
# registry-auth.service.d drop-in.
set -eu
d=$(dirname "$0")

if ! command -v doppler >/dev/null; then
  echo "registry-auth: install the doppler fragment first" >&2
  exit 1
fi

cp -R "$d/system_files/." /
systemctl enable registry-auth.service
