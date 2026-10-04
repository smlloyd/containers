# bootc fragments

Each directory here is published as a small multi-arch image,
`ghcr.io/smlloyd/bootc-fragments/<name>`, that RHEL bootc images compose in
their own Containerfile. The images hold no Red Hat content: scripted fragments
run their install step inside the consuming build.

| Fragment | Kind | Provides |
| --- | --- | --- |
| `rhel-base` | scripted | Base tweaks: systemd-resolved, tools, zram (RHEL 10) |
| `serial-console` | files-only | Serial console kargs (`ttyS0` on x86_64, `ttyAMA0` on aarch64) |
| `doppler` | scripted | Doppler CLI and `doppler-ready.service` |
| `tailscale` | scripted | Tailscale with Doppler-based registration (needs `doppler` first) |
| `kubevirt` | scripted | cloud-init and qemu-guest-agent |
| `incus` | scripted | Incus agent loader and cloud-init (VMs need an `agent:config` disk) |
| `gcp` | scripted | Google Compute Engine guest environment |
| `docker` | scripted | Docker CE (also installs `jq`) |
| `keycloak` | scripted | Keycloak (`keycloak-crdb`) quadlet on the Tailscale IP (needs `doppler` and `tailscale` first) |

## Layout

- `system_files/` is copied onto `/`.
- `install.sh`, if present, copies `system_files/` itself and runs the commands
  the fragment needs. It reads the RHEL release from `/etc/os-release`, so it
  takes no build args.

## Usage

Pin each fragment as a stage so Renovate tracks its digest, then copy
files-only fragments and run scripted ones:

```dockerfile
FROM ghcr.io/smlloyd/bootc-fragments/rhel-base:latest@sha256:… AS rhel-base
FROM ghcr.io/smlloyd/bootc-fragments/serial-console:latest@sha256:… AS serial-console
FROM ghcr.io/smlloyd/bootc-fragments/doppler:latest@sha256:… AS doppler
FROM ghcr.io/smlloyd/bootc-fragments/tailscale:latest@sha256:… AS tailscale

FROM registry.redhat.io/rhel10/rhel-bootc:latest@sha256:…
RUN --mount=type=bind,from=rhel-base,target=/f sh /f/install.sh
COPY --from=serial-console /system_files /
RUN --mount=type=bind,from=doppler,target=/f sh /f/install.sh
RUN --mount=type=bind,from=tailscale,target=/f sh /f/install.sh
```

The build needs a RHEL subscription for `dnf`; `build-rhel-bootc.yml`
registers one.
