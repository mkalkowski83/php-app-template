## this command can be run only from container
install:
	composer install --no-interaction --no-scripts
## this command can be run only from container
phpunit:
	bin/phpunit


bash: ## login into container
	docker-compose exec php bash
test: ## Run tests
	docker-compose exec php bin/phpunit --colors=always --coverage-text --coverage-html=build/coverage

build: ## Builds the Docker images
	docker-compose build --pull --no-cache

up: ## Start containers in detached mode (no logs)
	docker-compose up --detach

stop: ## Stop containers
	docker-compose php

remove: ## Remove containers
	docker-compose stop
	docker-compose rm -fv php
