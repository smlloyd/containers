FROM registry.fedoraproject.org/fedora:45@sha256:1bd80cd53c142fe07d25dac925494e02fa7aec33534ea30440e74f85014359a1

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
