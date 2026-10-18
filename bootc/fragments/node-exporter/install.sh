#!/bin/sh
# Runs Prometheus node_exporter as a bound-image quadlet that listens on the
# Tailscale IP.
set -eu
d=$(dirname "$0")

if ! command -v tailscale >/dev/null; then
  echo "node-exporter: install the tailscale fragment first" >&2
  exit 1
fi

cp -R "$d/system_files/." /

ln -sf /usr/share/containers/systemd/node-exporter.container /usr/lib/bootc/bound-images.d/node-exporter.container
systemctl enable node-exporter-setup.service
