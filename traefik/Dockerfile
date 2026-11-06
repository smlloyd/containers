FROM docker.io/traefik:latest@sha256:92627e6a99f71b8e46634acea28130b9f14bec5d9887ad15161007e1b652afe1

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler

ENTRYPOINT ["doppler", "run", "--", "/entrypoint.sh"]
