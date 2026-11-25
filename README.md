# Ghost: ReadyStack build kit

The offline build kit for the Docker image `readystack/ghost:v6.77.0-CE-ubuntu24.04-r2`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v6.77.0-CE-ubuntu24.04-r2](https://github.com/readystack-dev/ghost/releases/tag/v6.77.0-CE-ubuntu24.04-r2)
- Image: [`docker.io/readystack/ghost:v6.77.0-CE-ubuntu24.04-r2`](https://hub.docker.com/r/readystack/ghost/tags), manifest digest `sha256:9c2c4d8bf9138ebb8c8c298a1ee82d0050417cb1e1bb034cda7d12cb081d7069`
- Product page: https://readystack.dev/products/ghost
- Source and build recipe: https://readystack.dev/products/ghost/recipe
- Build trail: https://readystack.dev/products/ghost/trail/v6.77.0-CE-ubuntu24.04-r2
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=ghost

## The image

Single container (Node.js, `node index.js`, one foreground process) running Ghost. It REQUIRES an EXTERNAL MySQL 8 database the operator provisions and points the container at via database__connection__host/port/user/password/database env vars — there is NO embedded/SQLite database in production (SQLite is dev-only and unsupported in production; Ghost starts on it without any warning, so configure MySQL 8). On first start Ghost auto-runs knex-migrator to create its schema. NOT a multi-service cluster, but NOT self-contained: a MySQL 8 server is a hard external dependency; the content/ dir + DB must persist.

## Who uses Ghost and why

Writers, independent publishers and media teams who run a publication with a newsletter and paid memberships.

Ghost is an open-source publishing platform for running a website, email newsletters, memberships and paid subscriptions from one place.

A typical use: A journalist leaves a newspaper to publish independently. On Ghost each article appears on the website and goes out as a newsletter, readers sign up as free or paying members, and the publication and its audience stay on a site the writer controls.

From the upstream project's own description: https://github.com/TryGhost/Ghost, https://ghost.org/docs/introduction/.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-25 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 101 packages with copyleft licences (GPL, LGPL, MPL), 96 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component).
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`node`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-25; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/ghost.

Ghost is distributed under its upstream licence (MIT); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v6.77.0-CE-ubuntu24.04-r2 release](https://github.com/readystack-dev/ghost/releases/tag/v6.77.0-CE-ubuntu24.04-r2): `ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.tar.gz` (510.1 MB), SHA-256 `fa163d141c37220fb836a96c944526cadd0be556c3b52ef800e24c903b8873c3`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.rebuild.json.sigstore ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.tar.gz
cd v6.77.0-CE-ubuntu24.04-r2
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/ghost/recipe. The complete kit is the release download. Each release is a tag here.

— ReadyStack · https://readystack.dev
