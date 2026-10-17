FROM docker.io/traefik:latest@sha256:0f6150202bc1fed72a7bd2107460eaa510e5b8a905f3fdb5b84f2c8619c33368

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler

ENTRYPOINT ["doppler", "run", "--", "/entrypoint.sh"]
