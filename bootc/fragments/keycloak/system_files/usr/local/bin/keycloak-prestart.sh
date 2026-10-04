#!/bin/bash
set -e

TAILSCALE_IP=$(tailscale ip -4)

if [ -z "$TAILSCALE_IP" ]; then
  echo "FATAL: Could not determine Tailscale IP." >&2
  exit 1
fi

mkdir -p /run/keycloak
cat >/run/keycloak/env <<EOF
TAILSCALE_IP=${TAILSCALE_IP}
KC_CACHE_EMBEDDED_NETWORK_EXTERNAL_ADDRESS=${TAILSCALE_IP}
KC_CACHE_EMBEDDED_NETWORK_EXTERNAL_PORT=7800
EOF

echo "Tailscale IP resolved to ${TAILSCALE_IP}."
