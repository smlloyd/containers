#!/bin/sh
# Runs Keycloak (CockroachDB build) as a bound-image quadlet that listens on
# the Tailscale IP. Extra bindings belong in a keycloak.container.d drop-in.
set -eu
d=$(dirname "$0")

for dep in doppler tailscale; do
  if ! command -v "$dep" >/dev/null; then
    echo "keycloak: install the $dep fragment first" >&2
    exit 1
  fi
done

cp -R "$d/system_files/." /

ln -sf /usr/share/containers/systemd/keycloak.container /usr/lib/bootc/bound-images.d/keycloak.container
systemctl enable keycloak-setup.service
