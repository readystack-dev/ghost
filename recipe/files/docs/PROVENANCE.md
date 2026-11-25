# Provenance — Ghost (`v6.77.0-CE-ubuntu24.04-r2`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/TryGhost/Ghost
- Upstream release: `v6.77.0` (commit `228c3e2db9c590ec9fbfa7986509b69ebe4e19c2`), the source revision of the release artifact this image is built from
- Release artifact: https://registry.npmjs.org/ghost/-/ghost-6.77.0.tgz (sha256 `0dcf61a80cb15ffd11e8025f08fc7765a5c6a847a3715e55ec558ab5f6d93637`); the build installs it
- Source tree: `4792398a832bf954be6e755d14bca9b2dc478759e6d92f0be5235b780244ed40` over 9369 files [`docs/provenance/SOURCE_TREE_HASH.json`] — upstream's tree at that revision, cloned for the licence and Community Edition audit; the image is not built from it
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-node`; base image `ubuntu:24.04`
- Built with `--network=none` from the vendored upstream release artifact, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795543312` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/ghost:v6.77.0-CE-ubuntu24.04-r2` — index digest `sha256:d6c525f3d4b1325d05bac20b845edf57d8844d719ea49774931533b862468134` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:9c2c4d8bf9138ebb8c8c298a1ee82d0050417cb1e1bb034cda7d12cb081d7069` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.77.0-CE-ubuntu24.04-r2`

## Pinned inputs, and why

- 18 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 1, image digests 1, language runtimes and toolchains 1, dependency versions readystack sets 3, files the vendor stage downloads 1, pins in the kit's dockerfiles 3, readystack's build engine 1, dependencies upstream chose 2, services the release checks run beside 3).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.trail.json`, published beside this archive and signed with the release key (`ReadyStack-ghost-v6.77.0-CE-ubuntu24.04-r2.trail.json.sigstore`), and readable at https://readystack.dev/products/ghost/trail/v6.77.0-CE-ubuntu24.04-r2.

