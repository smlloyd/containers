#!/bin/sh
# Installs the Doppler CLI for secret management.
set -eu
d=$(dirname "$0")

cp -R "$d/system_files/." /

rpm --import 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key'
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/config.rpm.txt' \
  | sed '/^sslcacert=/d' > /etc/yum.repos.d/doppler-cli.repo
dnf install -y doppler
dnf clean all
systemctl enable doppler-ready.service
