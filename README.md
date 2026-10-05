# containers

A collection of custom container images and bootable container (bootc) configurations used across the `slloyd.net` infrastructure.

## Image Categories

### [Bootable Containers (bootc)](./bootc/)
Composable [fragments](./bootc/fragments/) for RHEL bootc images, published as small multi-arch images. Consuming repos build `FROM registry.redhat.io/rhelN/rhel-bootc` and add the fragments they need (base tweaks, serial console, Doppler, Tailscale, KubeVirt, Incus, GCP, Docker, Keycloak), using the shared [`build-rhel-bootc.yml`](./.github/workflows/build-rhel-bootc.yml) workflow.

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

### Tailscale Registration (bootc)
Hosts built with the `doppler` and `tailscale` fragments register themselves using a Doppler secret.

1. **Provide Doppler Token**: On the host (via cloud-init, Ansible, or manual setup), create `/etc/doppler.env`:
   ```bash
   DOPPLER_TOKEN=dp.pt.xxxxxx
   ```
2. **Registration**: `tailscale-register.service` runs at boot, fetches `TS_AUTHKEY` from Doppler, and runs `tailscale up` if the node has never logged in.

- **Internal Trust**: Custom CA certificates (`Lloyd+CA.crt`) are pre-installed in the trust store.
- **CI/CD**: Images are automatically built and published via [GitHub Actions](./.github/workflows/).

## Usage

Each subdirectory contains its own `Containerfile` or `Dockerfile` and specific documentation where applicable.
