# Ghost v6.79.0 — ReadyStack release `v6.79.0-CE-ubuntu24.04-r1`

Generated 2026-11-28 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/ghost:v6.79.0-CE-ubuntu24.04-r1` (linux/amd64). Index digest `sha256:8afc3789fc92af081e36b31d7c1e5833b256193b11e9e9972fccd7075fb09488` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:e9305805b776ce063e64eff6193033359747d963968a7153f324b63c9db356c4` [`TARGET_DIGEST.txt`].
- **Upstream:** Ghost v6.79.0 built from upstream's published release artifact https://registry.npmjs.org/ghost/-/ghost-6.79.0.tgz (sha256 `7f996c087903b0bff93fd5af228f4dec9a71c363da8d3f2ff5c619f8f9d9b53d`); its source is `v6.79.0` of https://github.com/TryGhost/Ghost — upstream notes: https://github.com/TryGhost/Ghost/releases/tag/v6.79.0 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** `ubuntu:24.04`; runtime user `node`.
- **Build:** `source-rebuild-node`, built offline with `--network=none`.
- **Supersedes:** ReadyStack release `v6.77.0-CE-ubuntu24.04-r2`.

## What changed in this release

- Upstream version v6.77.0 → v6.79.0.
- This release moves Ghost from 6.77.0 to 6.79.0, a release of upstream's newer 6.79.x line. Its first start runs Ghost's 6.79 database migrations, which move staff password hashes into a new user_accounts table; Ghost documents that an earlier release reads the old column, so an earlier image started on the migrated database locks out or reverts anyone whose password changed since. Back up the database before upgrading. Upstream's release notes list what changed: https://github.com/TryGhost/Ghost/releases/tag/v6.79.0

## Security status at release (measured 2026-11-28)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `node` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.79.0-CE-ubuntu24.04-r1` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.
- **Before exposing this service:** Setup at /ghost makes whoever completes it first the site Owner. Complete it before exposing the site.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:e9305805b776ce063e64eff6193033359747d963968a7153f324b63c9db356c4`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 2 of 2 use cases passed (2 authored) against the running image [`docs/validation/test-results.json`].
- The cases are `GET /` (200), `GET /ghost/api/admin/site/` (200); the suite checks nothing else.

## Known issues

- **high** (upstream): First visitor can claim the administrator account until setup is completed [`RSD-ghost-5168540d9b`]

## Defects fixed

- 15 problems found before release and fixed before it shipped (15 by review); each is listed in `docs/defects/defects.json`.

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/ghost:v6.79.0-CE-ubuntu24.04-r1
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

