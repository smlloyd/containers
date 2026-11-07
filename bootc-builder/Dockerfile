FROM registry.fedoraproject.org/fedora:45@sha256:5db9683660938d440b057d412247ee245172b9724f42428ae95ae01253bae699

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
