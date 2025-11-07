ARG KC_VERSION=26.4.4

FROM quay.io/phasetwo/keycloak-crdb:${KC_VERSION} AS builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=cockroach
ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_TRANSACTION_JTA_ENABLED=false

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

# Add slloyd.net CA
FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
ADD https://public-keys.slloyd.net/certs/Lloyd%2BCA.crt /etc/pki/ca-trust/source/anchors/slloydCA.crt
RUN update-ca-trust

# Install Doppler CLI
RUN rpm --import 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' && \
    curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/config.rpm.txt' | tee /etc/yum.repos.d/doppler-cli.repo && \
    yum install -y doppler

FROM quay.io/phasetwo/keycloak-crdb:${KC_VERSION}

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY --from=ubi-micro-build /etc/pki /etc/pki
COPY --from=ubi-micro-build /usr/bin/doppler /usr/bin/doppler


ENV KC_DB=cockroach
ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_TRANSACTION_JTA_ENABLED=false
ENV KC_DB_URL_PROPERTIES=useCockroachMetadata=true


ENTRYPOINT ["doppler", "run", "--", "/opt/keycloak/bin/kc.sh"]
