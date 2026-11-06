FROM registry.fedoraproject.org/fedora:45@sha256:5ad386251aa5d0111754dff91a930acc1a928afe7bafc46762024e096ab9bbb0

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
