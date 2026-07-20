FROM docker.io/traefik:latest@sha256:4299bbed850421258fc5448c2e0e6ad350981d4d335a68de11b92448aedbefe5

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler

COPY --chmod=755 doppler-entrypoint.sh /doppler-entrypoint.sh
ENTRYPOINT ["/doppler-entrypoint.sh"]
