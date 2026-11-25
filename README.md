# Ghost: ReadyStack build kit

The offline build kit for the Docker image `readystack/ghost:v6.77.0-CE-ubuntu24.04-r1`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v6.77.0-CE-ubuntu24.04-r1](https://github.com/readystack-dev/ghost/releases/tag/v6.77.0-CE-ubuntu24.04-r1)
- Image: [`docker.io/readystack/ghost:v6.77.0-CE-ubuntu24.04-r1`](https://hub.docker.com/r/readystack/ghost/tags), manifest digest `sha256:6bd288afad071c1549e2d885ba49218c681cedc0e7a0eca6686bf92601050478`
- Product page: https://readystack.dev/products/ghost
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=ghost

Ghost is distributed under its upstream licence (MIT); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v6.77.0-CE-ubuntu24.04-r1 release](https://github.com/readystack-dev/ghost/releases/tag/v6.77.0-CE-ubuntu24.04-r1): `ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r1.tar.gz` (510.2 MB), SHA-256 `a70babed14b4d2fa1590887afde01a81236efda5e08781072961708df4e5e3f8`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r1.rebuild.json.sigstore ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r1.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r1.tar.gz
cd v6.77.0-CE-ubuntu24.04-r1
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r1.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/ghost/recipe. The complete kit is the release download. Each release is a tag here.
