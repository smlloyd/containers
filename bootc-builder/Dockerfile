FROM registry.fedoraproject.org/fedora:45@sha256:7b6d9048825950573e58b7185631f6bd38f7c24f5c0e68ae902870aedebb86e0

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
