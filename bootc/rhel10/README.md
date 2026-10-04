# RHEL 10 Bootable Containers

Configurations for RHEL 10-based bootable containers.

## Variants
- **Base**: Standard RHEL 10 configuration.
- **Kubevirt**: Includes Kubevirt components (using `bootc/common/kubevirt`).
- **Kubevirt + Docker**: Includes Kubevirt components and Docker Engine (using `bootc/rhel-common/docker`).
- **Incus**: Includes the Incus agent loader and cloud-init for Incus VMs (using `bootc/common/incus`).
