#!/bin/sh
# Installs the Google Compute Engine guest environment.
set -eu
# shellcheck source=/dev/null
. /etc/os-release
major=${VERSION_ID%%.*}

# EL10 packages are signed with a separate key; the older keys use SHA-1, which EL10 rpm rejects.
if [ "$major" -ge 10 ]; then
  gpgkey="https://packages.cloud.google.com/yum/doc/rpm-package-key-v${major}.gpg"
else
  gpgkey="https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg"
fi

cat > /etc/yum.repos.d/google-cloud.repo <<REPO
[google-compute-engine]
name=Google Compute Engine
baseurl=https://packages.cloud.google.com/yum/repos/google-compute-engine-el${major}-\$basearch-stable
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=${gpgkey}
REPO
dnf install -y google-compute-engine
dnf clean all
