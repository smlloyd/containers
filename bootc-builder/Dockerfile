FROM registry.fedoraproject.org/fedora:45@sha256:db14be5698ea04f1f9a4f4fb31945205a696a01f1466cf4a7e5f5a77ca3c7a82

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
