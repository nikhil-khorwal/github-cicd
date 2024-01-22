DB_PORT=6544
DB_PASSWORD=Test1234
DB_NAME=zn_tanklayouts
app_name?=demo

install:
	@(poetry install)
	poetry shell

lint-and-test:
	rm -rf ./.tox | true
	tox

start-api:
	uvicorn demo.main:app --reload

postgres-db:
	docker network create simple || true
	-docker stop $(app_name)
	-docker rm $(app_name)
	docker run -d -e POSTGRES_DB=${DB_NAME} -e POSTGRES_PASSWORD=${DB_PASSWORD} --network=simple -p ${DB_PORT}:5432 --name $(app_name) postgres:15-alpine
	sleep 5
