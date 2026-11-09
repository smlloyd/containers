FROM registry.fedoraproject.org/fedora:45@sha256:b3bfa9b46c1a42b87020ea9053b56d24d713a0c551427669dee177230f1c720e

RUN dnf -y install podman buildah skopeo subscription-manager && \
    dnf clean all
