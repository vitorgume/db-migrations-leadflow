#!/usr/bin/env bash
set -euo pipefail
# Requer FLYWAY_URL, FLYWAY_USER, FLYWAY_PASSWORD no ambiente
docker run --rm \
  -v "$(pwd)":/work \
  -w /work \
  -e FLYWAY_URL -e FLYWAY_USER -e FLYWAY_PASSWORD \
  flyway/flyway:latest \
  -configFiles=flyway/flyway.conf migrate
