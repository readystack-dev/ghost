# Provenance — Ghost (`v6.79.0-CE-ubuntu24.04-r1`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/TryGhost/Ghost
- Upstream release: `v6.79.0` (commit `11ae15f26fdd3529175cc9691b6f8c7254f7dfd5`), the source revision of the release artifact this image is built from
- Release artifact: https://registry.npmjs.org/ghost/-/ghost-6.79.0.tgz (sha256 `7f996c087903b0bff93fd5af228f4dec9a71c363da8d3f2ff5c619f8f9d9b53d`); the build installs it
- Source tree: `54512de499a8a964c9c32416a56c47d8e1a67ae9336ddd173964a72898d0bce0` over 9648 files [`docs/provenance/SOURCE_TREE_HASH.json`] — upstream's tree at that revision, cloned for the licence and Community Edition audit; the image is not built from it
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-node`; base image `ubuntu:24.04`
- Built with `--network=none` from the vendored upstream release artifact, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795616083` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/ghost:v6.79.0-CE-ubuntu24.04-r1` — index digest `sha256:8afc3789fc92af081e36b31d7c1e5833b256193b11e9e9972fccd7075fb09488` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:e9305805b776ce063e64eff6193033359747d963968a7153f324b63c9db356c4` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.79.0-CE-ubuntu24.04-r1`

## Pinned inputs, and why

- 19 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 1, image digests 1, language runtimes and toolchains 1, dependency versions readystack sets 4, files the vendor stage downloads 1, pins in the kit's dockerfiles 3, readystack's build engine 1, dependencies upstream chose 2, services the release checks run beside 3).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-ghost-v6.79.0-CE-ubuntu24.04-r1.trail.json`, published beside this archive and signed with the release key (`ReadyStack-ghost-v6.79.0-CE-ubuntu24.04-r1.trail.json.sigstore`), and readable at https://readystack.dev/products/ghost/trail/v6.79.0-CE-ubuntu24.04-r1.

