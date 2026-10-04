#!/bin/sh
# Applies the base RHEL customisations shared by every image.
set -eu
d=$(dirname "$0")
# shellcheck source=/dev/null
. /etc/os-release

cp -R "$d/system_files/." /
if [ "${VERSION_ID%%.*}" -ge 10 ]; then
  cp -R "$d/system_files_rhel10/." /
fi

systemctl disable kdump
systemctl mask rpm-ostree-countme.timer
dnf install -y rhc dnf-plugins-core vim zsh tmux systemd-resolved tuned
dnf clean all
systemctl enable systemd-resolved.service
