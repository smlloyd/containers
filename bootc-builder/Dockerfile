FROM registry.fedoraproject.org/fedora:45@sha256:e203b4174f6a2ce6c160ddc4917d85e6bfce32dfc610d953b355d63ec4c17909

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
