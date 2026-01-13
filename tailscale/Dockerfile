FROM docker.io/tailscale/tailscale:stable@sha256:4a0aaacee6f28e724c1f80c986e5776c9c979d8f7e19274c2cae2d495cc8d625

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler


CMD ["doppler", "run", "--", "usr/local/bin/containerboot"]
