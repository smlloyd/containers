ARG KC_VERSION=latest@sha256:bbb299c7e58a2c61c683dc3439da3e2698e005ca88ba6fd249629311d70250ab

FROM quay.io/keycloak/keycloak:${KC_VERSION} AS builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=oracle

ADD --chown=keycloak:keycloak --chmod=644 https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc17/23.6.0.24.10/ojdbc17-23.6.0.24.10.jar /opt/keycloak/providers/ojdbc17.jar
ADD --chown=keycloak:keycloak --chmod=644 https://repo1.maven.org/maven2/com/oracle/database/nls/orai18n/23.6.0.24.10/orai18n-23.6.0.24.10.jar /opt/keycloak/providers/orai18n.jar

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

FROM quay.io/keycloak/keycloak:${KC_VERSION}

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY --from=ubi-micro-build /etc/pki /etc/pki
COPY --from=ubi-micro-build /usr/bin/doppler /usr/bin/doppler

ENV KC_DB=oracle

ENTRYPOINT ["doppler", "run", "--", "/opt/keycloak/bin/kc.sh"]
