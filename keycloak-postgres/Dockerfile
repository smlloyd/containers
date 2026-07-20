ARG KC_VERSION=latest@sha256:2eb3cd316835c990e69e26ade292ffa78f6fb0db7d5fc6377463c162e1979ac0

FROM quay.io/keycloak/keycloak:${KC_VERSION} AS builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
ADD https://public-keys.slloyd.net/certs/Lloyd%2BCA.crt /etc/pki/ca-trust/source/anchors/slloydCA.crt
RUN update-ca-trust

# Install Doppler CLI
RUN rpm --import 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' && \
    curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/config.rpm.txt' | tee /etc/yum.repos.d/doppler-cli.repo && \
    yum install -y doppler

FROM quay.io/keycloak/keycloak:${KC_VERSION}

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY --from=ubi-micro-build /etc/pki /etc/pki
COPY --from=ubi-micro-build /usr/bin/doppler /usr/bin/doppler

ENV KC_DB=postgres

COPY --chmod=755 doppler-entrypoint.sh /doppler-entrypoint.sh
ENTRYPOINT ["/doppler-entrypoint.sh"]
