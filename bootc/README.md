# Bootable Containers (bootc)

Building blocks for RHEL bootc images. This repository publishes no RHEL
content itself; images are built in the consuming repositories.

- `fragments/`: one directory per fragment, each published as
  `ghcr.io/smlloyd/bootc-fragments/<name>`. See its README for usage.
- `test/`: a Containerfile that CI uses to build and lint fragment
  combinations from this tree.
