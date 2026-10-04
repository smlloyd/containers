#!/bin/sh
# Installs Docker CE from Docker's repo, replacing any distro Docker packages.
# Also installs jq, which images building on this rely on.
set -eu
d=$(dirname "$0")

cp -R "$d/system_files/." /

dnf -y remove docker docker-client docker-client-latest docker-common docker-latest \
  docker-latest-logrotate docker-logrotate docker-engine runc
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin jq
dnf clean all
mkdir -p /etc/docker
echo '{"firewall-backend":"nftables"}' > /etc/docker/daemon.json
systemctl enable docker
# The group comes from sysusers.d at boot instead
groupdel docker
