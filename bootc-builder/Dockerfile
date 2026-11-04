FROM registry.fedoraproject.org/fedora:46@sha256:02031526999d46c9f9c6490eeccf4cafd735438b9d0fb5e1d9fc941d7886e2ff

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
