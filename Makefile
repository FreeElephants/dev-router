_TITLE := "\033[32m[%s]\033[0m %s\n" # Green text for "printf"
_ERROR := "\033[31m[%s]\033[0m %s\n" # Red text for "printf"

include .env

.env: dist.env
	@if [[ -z "$(CI)" ]]; then \
		REPLY="" ; \
		read -p "⚠  Missing .env file. Copy from dist.env? [y/n] > " -r ; \
		if [[ ! $$REPLY =~ ^[Yy]$$ ]]; then \
			printf $(_ERROR) "No" "Copying canceled" ; \
			exit 1 ; \
		else \
			printf $(_TITLE) "Yes" "Copying from dist.env" ; \
			cp -i dist.env .env ; \
			exit 0; \
		fi \
	fi

.PHONY: install
install:
	docker compose pull
	docker network create $(DEV_ROUTER_NETWORK)

.PHONY: run
run:
	docker compose up -d

.PHONY: stop
stop:
	docker compose down

.PHONY: remove
remove: stop
	docker network remove $(DEV_ROUTER_NETWORK) 

.PHONY: restart
restart: stop run
