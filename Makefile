install:
	cp docker.env .env
	docker compose pull
	docker network create dev-router

run:
	docker compose up -d

stop:
	docker compose down

restart: stop run

remove: stop
	docker network remove dev-router

