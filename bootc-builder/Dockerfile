FROM registry.fedoraproject.org/fedora:45@sha256:e211ec1185709f42dadf927dafd2bc672923511c7367c6747975f76878fb71e3

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
