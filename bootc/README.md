# Bootable Containers (bootc)

This directory contains configurations for building bootable container images based on Fedora and Red Hat Enterprise Linux (RHEL). These images are designed to be deployed as immutable operating systems.

## Structure

- **Base Distributions**:
  - `fedora/`: Fedora-based bootc configurations.
  - `rhel9/`: RHEL 9-based bootc configurations.
  - `rhel10/`: RHEL 10-based bootc configurations.

- **Shared Resources**:
  - `common/`: configurations shared across multiple distributions (e.g., `k3s`, `kubevirt`).
  - `rhel-common/`: configurations shared across RHEL versions (e.g., `clevis`, `docker`, `k3s` specific to RHEL).

## Usage

Each distribution directory contains a `Containerfile` that defines the base image and layers on additional configurations from the shared directories.
