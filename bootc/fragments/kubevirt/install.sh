#!/bin/sh
# Installs the guest tooling for KubeVirt VMs.
set -eu

dnf install -y cloud-init qemu-guest-agent
dnf clean all
ln -sf ../cloud-init.target /usr/lib/systemd/system/default.target.wants/
