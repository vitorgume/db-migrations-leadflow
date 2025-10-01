ENV ?= dev
include flyway/env/.env.$(ENV)

.PHONY: migrate validate info repair
migrate:
	./flyway/scripts/migrate.sh
validate:
	./flyway/scripts/validate.sh
info:
	./flyway/scripts/info.sh
repair:
	./flyway/scripts/repair.sh
