change-namespace:
	@read -p "New Namespace: " new_namespace; \
	sed -i '' "s/AppTemplate\\\\/$$new_namespace\\\\/g" composer.json

change-container-name:
	@read -p "New container name: " new_container_name; \
	sed -i '' "s/php_app_template_php/php_$$new_container_name\_php/g" docker-compose.yaml
	sed -i '' "s/app_template_network/$$new_container_name\_network/g" docker-compose.yaml

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
bash: ## login into container (bash)
	docker-compose exec php bash

install: ## Install dependencies
	docker-compose exec php composer install --no-interaction --no-scripts

test: ## Run tests
	docker-compose exec php bin/phpunit tests --colors=always --coverage-text --coverage-html=build/coverage

init: change-namespace change-container-name build up install

