FROM registry.fedoraproject.org/fedora:45@sha256:10989b31ee8859a592f8f8d9992406d7d4483e99091e6ff686a352b6c040dccd

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
