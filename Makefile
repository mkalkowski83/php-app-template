## this commands can be run only from container
install:
	composer install --no-interaction --no-scripts
phpunit:
	bin/phpunit

sh: ## login into container (shell)
	docker-compose exec php sh
bash: ## login into container (bash)
	docker-compose exec php bash
test: ## Run tests
	docker-compose exec php bin/phpunit tests --colors=always --coverage-text --coverage-html=build/coverage

## Docker commands
build: ## Builds the Docker images
	docker-compose build --pull --no-cache
up: ## Start containers in detached mode (no logs)
	docker-compose up --detach
stop: ## Stop containers
	docker-compose php
remove: ## Remove containers
	docker-compose stop
	docker-compose rm -fv php

change-namespace:
	@read -p "New Namespace: " new_namespace; \
	sed -i '' "s/AppTemplate\\\\/$$new_namespace\\\\/g" composer.json

change-container-name:
	@read -p "New container name: " new_container_name; \
	sed -i '' "s/php_app_template_php/php_$$new_container_name\_php/g" docker-compose.yaml

init: change-namespace change-container-name
