FROM registry.fedoraproject.org/fedora:45@sha256:ea6d638d83c7bf2f4dd082e804c4a125feee764ba82e3e7798148673e445a496

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
