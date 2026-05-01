---
name: Personal Site Project
description: Hunter's personal portfolio site at hunterandmarykate.org/hunter — Astro static site on home k8s cluster
type: project
---

Astro 5 static site for hunter's personal portfolio, hosted on his home k8s cluster.

**Stack:** Astro 5 (base: '/hunter', trailingSlash: always), nginx:1.27-alpine container, Helm chart under helm/hunter/, nginx ingress controller routes /hunter prefix to service.

**Architecture:** Multi-stage Dockerfile (node:22-alpine build → nginx:1.27-alpine serve). Static files land at /usr/share/nginx/html/hunter/ in container. No path rewrite in ingress — container nginx handles /hunter/ prefix natively. Astro base config + nginx location block keep the path consistent.

**Pages:** About (index), Projects, Resume, Contact. Dark minimal CSS design (--bg: #0c0c0c, --accent: #5a9cf5).

**Featured projects:** home k8s cluster, home automation, cycling/GPX power data analysis, architecture diagrams from past work.

**Future routes planned:** /marykate (separate Helm chart/image), home automation app as separate route. The repo structure at personalSite/ will eventually hold multiple sites.

**Resume:** placeholder experience/education content — user needs to fill in real work history.

**Contact:** Uses myers.hunter@gmail.com. GitHub username in contact page may need updating (huntermyers is a placeholder).

**Why:** Self-hosted portfolio to demonstrate infrastructure skills; hosted on the same k8s cluster it documents.

**How to apply:** When adding /marykate or new services, mirror the helm/hunter chart structure in a new helm/<name>/ directory. Keep each site's container self-contained with its own base path.
