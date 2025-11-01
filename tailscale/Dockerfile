FROM docker.io/tailscale/tailscale:stable@sha256:8eb8b450a85856807e8a216c4697333e15f8701cb6d344bed851bf6aa6a9605c

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler


CMD ["doppler", "run", "--", "usr/local/bin/containerboot"]
