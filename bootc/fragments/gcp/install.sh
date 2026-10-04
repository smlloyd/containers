#!/bin/sh
# Installs the Google Compute Engine guest environment.
set -eu
# shellcheck source=/dev/null
. /etc/os-release

cat > /etc/yum.repos.d/google-cloud.repo <<REPO
[google-compute-engine]
name=Google Compute Engine
baseurl=https://packages.cloud.google.com/yum/repos/google-compute-engine-el${VERSION_ID%%.*}-\$basearch-stable
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
      https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
REPO
dnf install -y google-compute-engine
dnf clean all
