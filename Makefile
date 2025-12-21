-include .env

.PHONY: install
install:
	cp -i dist.env .env
	docker compose pull
	. ./.env && docker network create $$DEV_ROUTER_NETWORK

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
