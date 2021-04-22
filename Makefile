.PHONY: build, run

build:
	docker-compose build vue-app

run:
	docker-compose up vue-app
