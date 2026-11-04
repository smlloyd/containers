FROM registry.fedoraproject.org/fedora:45@sha256:f5afe36c8ddb2aa5333597e900f53c5ed0267d9ebb27be765dc8ec2633aa1648

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
