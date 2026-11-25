# Ghost v6.77.0 — ReadyStack release `v6.77.0-CE-ubuntu24.04-r2`

Generated 2026-11-25 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/ghost:v6.77.0-CE-ubuntu24.04-r2` (linux/amd64). Index digest `sha256:d6c525f3d4b1325d05bac20b845edf57d8844d719ea49774931533b862468134` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:9c2c4d8bf9138ebb8c8c298a1ee82d0050417cb1e1bb034cda7d12cb081d7069` [`TARGET_DIGEST.txt`].
- **Upstream:** Ghost v6.77.0 built from upstream's published release artifact https://registry.npmjs.org/ghost/-/ghost-6.77.0.tgz (sha256 `0dcf61a80cb15ffd11e8025f08fc7765a5c6a847a3715e55ec558ab5f6d93637`); its source is `v6.77.0` of https://github.com/TryGhost/Ghost — upstream notes: https://github.com/TryGhost/Ghost/releases/tag/v6.77.0 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `node`.
- **Build:** `source-rebuild-node`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `v6.77.0-CE-ubuntu24.04-r1`.

## What changed in this release

- Upstream version unchanged (v6.77.0); ReadyStack rebuild.
- Ghost v6.77.0 is unchanged from the release this supersedes (v6.77.0-CE-ubuntu24.04-r1); this release rebuilds it. Changes: libssh-4 moves from 0.10.6-2ubuntu0.5 to 0.10.6-2ubuntu0.6 (USN-9187-1). Settings, ports and data volumes are those of v6.77.0-CE-ubuntu24.04-r1: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-25)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `node` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.77.0-CE-ubuntu24.04-r2` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.
- **Before exposing this service:** Setup at /ghost makes whoever completes it first the site Owner. Complete it before exposing the site.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:9c2c4d8bf9138ebb8c8c298a1ee82d0050417cb1e1bb034cda7d12cb081d7069`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 2 of 2 use cases passed (2 authored) against the running image [`docs/validation/test-results.json`].
- The cases are `GET /` (200), `GET /ghost/api/admin/site/` (200); the suite checks nothing else.

## Known issues

- **high** (upstream): First visitor can claim the administrator account until setup is completed [`RSD-ghost-5726973610`]

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.77.0-CE-ubuntu24.04-r2
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

