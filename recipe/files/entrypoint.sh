#!/bin/sh
set -e
# Ghost content dir (themes/images/media/settings/logs/adapters) lives OUTSIDE the code tree at
# /var/lib/ghost/content and is a persisted volume. On a fresh/empty volume, seed the bundled
# default theme + settings from the code tree's content/ (replicates the official image) so Ghost
# can render before any admin setup. Idempotent: only fills empty dirs.
CONTENT="${paths__contentPath:-/var/lib/ghost/content}"
SRC=/var/lib/ghost/current/content
for d in themes settings adapters data images media files logs public; do
  mkdir -p "$CONTENT/$d"
done
for d in themes settings adapters; do
  if [ -d "$SRC/$d" ] && [ -z "$(ls -A "$CONTENT/$d" 2>/dev/null)" ]; then
    cp -r "$SRC/$d/." "$CONTENT/$d/" 2>/dev/null || true
  fi
done
cd /var/lib/ghost/current
# Ghost auto-runs knex-migrator on boot: an empty DB -> init() creates all tables + seeds
# fixtures; an existing DB -> migrate() applies upgrades. No separate migrate command needed.
# The external MySQL is waited healthy by the orchestrator before this runs.
exec node index.js
