PROJECT_NAME=log-aggregation-loki
DOCKER_COMPOSE=docker-compose

.PHONY: up down restart logs grafana prometheus nginx clean

## Start all services (Nginx, Loki, Promtail, Prometheus, Node Exporter, Grafana)
up:
	@echo "🚀 Starting $(PROJECT_NAME) stack..."
	$(DOCKER_COMPOSE) up -d

## Stop all services
down:
	@echo "🛑 Stopping $(PROJECT_NAME) stack..."
	$(DOCKER_COMPOSE) down

## Restart all services
restart: down up

## Show combined logs of all services
logs:
	$(DOCKER_COMPOSE) logs -f

## Open Grafana in default browser
grafana:
	@echo "🌐 Opening Grafana at http://localhost:3000 (admin/admin)"
	@xdg-open http://localhost:3000 || open http://localhost:3000 || true

## Open Prometheus in default browser
prometheus:
	@echo "🌐 Opening Prometheus at http://localhost:9090"
	@xdg-open http://localhost:9090 || open http://localhost:9090 || true

## Open Nginx test app in default browser
nginx:
	@echo "🌐 Opening Nginx test app at http://localhost:8080"
	@xdg-open http://localhost:8080 || open http://localhost:8080 || true

## Remove containers, networks, and volumes
clean:
	@echo "🔥 Removing all containers, networks, and volumes..."
	$(DOCKER_COMPOSE) down -v
