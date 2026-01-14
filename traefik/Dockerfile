FROM docker.io/traefik:latest@sha256:03650d05c2ce54959c1016c879371d20ad303ecbaecc1621f6ed231cd2e0b516

# Install Doppler CLI
RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler


CMD ["doppler", "run", "--", "traefik"]
