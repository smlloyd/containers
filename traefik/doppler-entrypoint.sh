#!/bin/sh
until doppler me >/dev/null 2>&1; do
  sleep 5
done
exec doppler run -- /entrypoint.sh "$@"
