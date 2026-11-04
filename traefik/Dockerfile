FROM docker.io/traefik:latest@sha256:68ae5fe5b64ca166704b746a9e8afcd385e36b3f569a5691401bf652d57b3748

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler

ENTRYPOINT ["doppler", "run", "--", "/entrypoint.sh"]
