# Variables
DOCKER_COMPOSE = docker-compose
DJANGO_MANAGE = python manage.py
COVERAGE = coverage

# Default target: Build and run the application
.PHONY: up
up: ## Build and start the Docker containers
	$(DOCKER_COMPOSE) up --build

.PHONY: down
down: ## Stop and remove the Docker containers
	$(DOCKER_COMPOSE) down

.PHONY: migrate
migrate: ## Run Django migrations
	$(DOCKER_COMPOSE) run lao_auth_backend $(DJANGO_MANAGE) migrate

.PHONY: makemigrations
makemigrations: ## Create new Django migrations
	$(DOCKER_COMPOSE) run lao_auth_backend $(DJANGO_MANAGE) makemigrations

.PHONY: shell
shell: ## Run the Django shell
	$(DOCKER_COMPOSE) run lao_auth_backend $(DJANGO_MANAGE) shell

.PHONY: test
test: ## Run Django tests
	$(DOCKER_COMPOSE) run lao_auth_backend $(DJANGO_MANAGE) test

.PHONY: coverage
coverage: ## Run tests with coverage
	$(DOCKER_COMPOSE) run lao_auth_backend $(COVERAGE) run --source='.' $(DJANGO_MANAGE) test
	$(DOCKER_COMPOSE) run lao_auth_backend $(COVERAGE) report
	$(DOCKER_COMPOSE) run lao_auth_backend $(COVERAGE) html

.PHONY: logs
logs: ## View the logs for the containers
	$(DOCKER_COMPOSE) logs -f

.PHONY: rebuild
rebuild: ## Rebuild Docker images without using the cache
	$(DOCKER_COMPOSE) build --no-cache

.PHONY: help
help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
