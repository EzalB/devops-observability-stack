# 🚀 Observability Project: Logs + Metrics with Grafana

This project demonstrates **end-to-end observability** using:
- **Nginx** → Demo app
- **Promtail + Loki** → Log aggregation
- **Prometheus + Node Exporter** → Metrics collection
- **Grafana** → Dashboards for both logs & metrics

---

## 🔧 Setup

### Using Docker Compose

```bash
docker-compose up -d
```

### Using Makefile
```
# Start the whole stack
make up

# View logs
make logs

# Restart stack
make restart

# Stop stack
make down

# Open Grafana in browser
make grafana

# Clean everything (including volumes/data)
make clean
```

## Services

- Nginx → http://localhost:8080
- Grafana → http://localhost:3000
- Prometheus → http://localhost:9090
- Loki → http://localhost:3100

## 📊 Dashboards

1. Import grafana-dashboard.json into Grafana.
2. Add two data sources:
   - Loki → http://loki:3100
   - Prometheus → http://prometheus:9090

### Example Panels:

1. Logs: Nginx access/error logs
2. Error Rate: 500s vs all requests
3. Metrics: CPU usage, memory usage, disk usage from Node Exporter