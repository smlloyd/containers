FROM registry.fedoraproject.org/fedora:45@sha256:b174cd5906c712f59a675cc85ea2ca8ff3bcf3643f1a1f3bc4e14dc28bcf1872

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
