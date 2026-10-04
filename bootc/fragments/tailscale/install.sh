#!/bin/sh
# Installs Tailscale and enables registration with an auth key from Doppler.
set -eu
d=$(dirname "$0")
# shellcheck source=/dev/null
. /etc/os-release

if ! command -v doppler >/dev/null; then
  echo "tailscale: install the doppler fragment first" >&2
  exit 1
fi

cp -R "$d/system_files/." /

dnf config-manager --add-repo "https://pkgs.tailscale.com/stable/rhel/${VERSION_ID%%.*}/tailscale.repo"
dnf install -y tailscale
dnf clean all
# systemd-resolved's resolvconf shim makes tailscaled pick openresolv mode and clobber /etc/resolv.conf instead of using its systemd-resolved D-Bus manager
rm -f /usr/sbin/resolvconf /usr/bin/resolvconf
systemctl enable tailscaled tailscale-register.service
