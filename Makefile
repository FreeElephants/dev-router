$(shell cp --update=none dist.env .env)
include .env

install:
	docker compose pull
	docker network create $(DEV_ROUTER_NETWORK)

run:
	docker compose up -d

stop:
	docker compose down

restart: stop run

remove: stop
	docker network remove dev-router

