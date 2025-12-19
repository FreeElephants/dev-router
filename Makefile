include .env

.env: dist.env
	@if [[ -z "$(CI)" ]]; then \
		REPLY="" ; \
		read -p "Missing .env file. Copy from dist.env? [y/n] > " -r ; \
		if [[ ! $$REPLY =~ ^[Yy]$$ ]]; then \
			exit 1 ; \
		else \
			cp -i dist.env .env ; \
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
