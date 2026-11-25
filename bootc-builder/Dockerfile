FROM registry.fedoraproject.org/fedora:45@sha256:92837d4834c1cff45cc2d534b655489b8e536271de1897932117e396cc9980c5

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
