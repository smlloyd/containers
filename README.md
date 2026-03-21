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
- **Composable bootc Modules**: The `bootc/common/` directory contains reusable modules that can be layered during image builds:
  - **Doppler (`bootc/common/doppler/`)**: Installs the Doppler CLI for secret management.
  - **Tailscale (`bootc/common/tailscale/`)**: Installs Tailscale and includes an automated registration service.

### Tailscale Registration (bootc)
When using the composable Tailscale module, hosts can automatically register themselves using a Doppler secret.

1. **Provide Doppler Token**: On the host (via Ignition, Ansible, or manual setup), create the file `/etc/default/tailscale-register`:
   ```bash
   DOPPLER_TOKEN=dp.pt.xxxxxx
   ```
2. **Registration**: The `tailscale-register.service` will automatically run at boot, fetch the `TS_AUTHKEY` from Doppler, and execute `tailscale up`.

- **Internal Trust**: Custom CA certificates (`Lloyd+CA.crt`) are pre-installed in the trust store.
- **CI/CD**: Images are automatically built and published via [GitHub Actions](./.github/workflows/).

## Usage

Each subdirectory contains its own `Containerfile` or `Dockerfile` and specific documentation where applicable.
