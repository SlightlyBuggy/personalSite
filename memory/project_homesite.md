---
name: Rain Barrel Automation App (homeSite)
description: Django home automation/sprinkler app at /Users/huntermyers/Code/homeSite — Docker Hub image myersc6535/rain-barrel-automation
type: project
---

Django 3.2.7 / Python 3.10 home automation app for smart sprinkler scheduling. Communicates with IoT devices via MQTT (Mosquitto broker). PostgreSQL database via CNPG in k8s.

**Source:** /Users/huntermyers/Code/homeSite
**Helm chart:** /Users/huntermyers/Code/rain-barrel-automation-helm
**Image:** myersc6535/rain-barrel-automation (Docker Hub, AMD64)
**Current tag:** 0.0.7 (as of 2026-05-01)

**Build/release workflow:** Makefile at homeSite/Makefile
- `make release TAG=0.0.8` — builds image, pushes to Docker Hub, updates Helm values tag
- `make deploy` — runs helmfile sync for rain-barrel release from homelab/

**Key settings:**
- ALLOWED_HOSTS includes '.hunterandmarykate.org' (wildcard subdomain) — covers rain-barrel.hunterandmarykate.org
- DB credentials via env vars: DATABASE_ENGINE, DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_HOST, DATABASE_PORT
- MQTT broker URL via BROKER_URL env var
- App listens on port 8000 (Django dev server — not gunicorn)

**Ingress:** Traefik, host-based at rain-barrel.hunterandmarykate.org (converted from LoadBalancer 192.168.0.132)
- MQTT (1883) and DB (5432) services remain as LoadBalancer with reserved IPs

**Cluster resources that stay as LoadBalancer (non-HTTP):**
- MQTT broker: 192.168.0.130
- PostgreSQL: 192.168.0.129

**Why:** Part of home automation setup on k8s cluster. Manages rain barrel irrigation scheduling based on weather/precipitation data.

**How to apply:** When making code changes, use `make release TAG=<new-version>` from homeSite/. Use semantic versioning (current: 0.0.7). The Makefile updates the Helm chart values automatically.
