#!/bin/sh
# Installs the Incus agent loader and cloud-init for Incus VMs.
# Loader files are vendored from lxc/incus v7.0.1
# internal/server/instance/drivers/agent-loader/ with TARGET set to /usr/lib.
# The host serves the agent binary; the udev rule only fires under Incus.
set -eu
d=$(dirname "$0")

cp -R "$d/system_files/." /

dnf install -y cloud-init
dnf clean all
ln -sf ../cloud-init.target /usr/lib/systemd/system/default.target.wants/
semanage fcontext -a -t bin_t '/run/incus_agent/incus-agent'
