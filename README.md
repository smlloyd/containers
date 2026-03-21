# containers

A collection of custom container images and bootable container (bootc) configurations used across the `slloyd.net` infrastructure.

## Image Categories

### [Bootable Containers (bootc)](./bootc/)
These images are based on Fedora and RHEL, designed to be booted as complete operating systems using the `bootc` workflow.

- **Base Images**: [Fedora](./bootc/fedora/), [RHEL 9](./bootc/rhel9/), [RHEL 10](./bootc/rhel10/)
- **Specialisations**:
  - **k3s**: Optimized for running k3s nodes.
  - **Kubevirt**: Configured for virtualization workloads.
  - **GCP**: Tailored for Google Cloud Platform.
  - **Tailscale**: Integrated Tailscale connectivity.

### Service Containers
Customised versions of popular services, often including the Doppler CLI for secret management and internal CA certificates.

- **Keycloak**:
  - [CockroachDB](./keycloak-crdb/)
  - [PostgreSQL](./keycloak-postgres/)
  - [Oracle](./keycloak-oracle/)
- **[Tailscale](./tailscale/)**: Tailscale image with Doppler integration.
- **[Traefik](./traefik/)**: Traefik edge router with Doppler integration.

## Common Features

- **Secret Management**: Most service containers include the [Doppler CLI](https://www.doppler.com/) to inject secrets at runtime.
- **Internal Trust**: Custom CA certificates (`Lloyd+CA.crt`) are pre-installed in the trust store.
- **CI/CD**: Images are automatically built and published via [GitHub Actions](./.github/workflows/).

## Usage

Each subdirectory contains its own `Containerfile` or `Dockerfile` and specific documentation where applicable.
