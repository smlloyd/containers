FROM docker.io/traefik:latest@sha256:843ad4111d6d611e2c28ca8ca43ad9d8b36551e4b354d766ccbe6dd50dd98b30

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler


CMD ["doppler", "run", "--", "traefik"]
