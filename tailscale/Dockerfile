FROM docker.io/tailscale/tailscale:stable@sha256:9e2bfdd9e2ce724df53f976d06a4a9933aa730dc655ace42798f4c73735d1cac

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler


CMD ["doppler", "run", "--", "usr/local/bin/containerboot"]
