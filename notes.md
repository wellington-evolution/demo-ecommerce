# Chosen Technologies

- Frontend: Next.js (TypeScript)
- Backend: Django (Python)
- Database: PostgreSQL
- Service Discovery & API Gateway: Traefik
- Observability: Grafana, Prometheus, Loki, Tempo, Promtail, Blackbox Exporter
- Authentication: JWT, Argon2 (password hashing)
- Testing: Jest, React Testing Library, Cypress, MSW (frontend); pytest, pytest-django, pytest-asyncio, Factory Boy, Faker (backend); Playwright (E2E)
- Security: Trivy (container scanning), security headers, rate limiting, TLS, network policies
- CI/CD: GitHub Actions, GitHub Secrets
- Local Development: Docker Compose (with profiles), devcontainer (Debian-based)

1. Project Structure
```
demo-ecommerce/
├── .devcontainer/
│   └── devcontainer.json
├── .github/
|   ├── workflows/
|   |   └──ci.yml
│   └── .dependabot.yml
├── docker/
│   ├── compose/
│   │   ├── compose.yml
│   │   └── compose.override.yml
│   └── kubernetes/
│       ├── deployment.yaml
│       ├── service.yaml
│       └── ingress.yaml
├── frontend/
│   ├── web/
│   │   ├── package.json
│   │   ├── tsconfig.json
│   │   ├── next.config.ts
│   │   ├── next-env.d.ts
│   │   ├── postcss.config.mjs
│   │   ├── eslint.config.mjs
│   │   ├── README.md
│   │   ├── public/
│   │   │   ├── file.svg
│   │   │   ├── globe.svg
│   │   │   ├── next.svg
│   │   │   ├── vercel.svg
│   │   │   └── window.svg
│   │   └── src/
│   │       └── app/
│   │           ├── favicon.ico
│   │           ├── globals.css
│   │           ├── layout.tsx
│   │           └── page.tsx
│   ├── src/
│   ├── tests/
│   └── Dockerfile
├── monitoring/
│   ├── prometheus/
│   │   └── prometheus.yml
│   ├── grafana/
│   │   └── provisioning/
│   │       └── datasources/
│   │           └── datasource.yml
│   ├── loki/
│   │   └── loki-config.yaml
│   ├── tempo/
│   │   └── tempo-config.yaml
│   ├── promtail/
│   │   └── promtail-config.yaml
│   └── blackbox/
│       └── blackbox.yml
├── services/
│   ├── item/
│   │   ├── manage.py
│   │   ├── config/
│   │   │   ├── __init__.py
│   │   │   ├── asgi.py
│   │   │   ├── settings.py
│   │   │   ├── urls.py
│   │   │   └── wsgi.py
│   │   ├── item/
│   │   │   ├── __init__.py
│   │   │   ├── admin.py
│   │   │   ├── apps.py
│   │   │   ├── models.py
│   │   │   ├── tests.py
│   │   │   ├── views.py
│   │   │   └── migrations/
│   │   │       └── __init__.py
│   │   └── db.sqlite3
│   ├── auth/
│   │   ├── src/
│   │   ├── tests/
│   │   └── Dockerfile
│   └── order/
│       ├── src/
│       ├── tests/
│       └── Dockerfile
├── .env
├── .pre-commit-config.yaml
├── notes.md
└── README.md
```

2. Initial Setup
  - [x] Set up the base Docker Compose configuration (including Traefik as API gateway)
  - [x] Configure the monitoring stack (Grafana, Prometheus, Loki, Tempo, Promtail, Blackbox Exporter)
  - [x] Set up the database service (item-db) in Docker Compose
  - [x] Add observability configs to item-db for monitoring
  - [x] Integrate devcontainer for local development
  - [x] Add .env and initial documentation
3. Authentication Service
  - [ ] Implement basic JWT authentication
  - [ ] Set up password hashing with Argon2
  - [ ] Create basic user management endpoints
  - [ ] Add unit and integration tests (pytest, Factory Boy, Faker)
4. Item Service
  - [x] Set up the initial Django project (manage.py, config/, item/ app, db.sqlite3)
  - [ ] Create the basic CRUD endpoints
  - [ ] Implement basic database migrations
  - [ ] Add unit and integration tests
5. Frontend
  - [x] Set up Next.js project (TypeScript, src/app, public/, config files)
  - [ ] Create basic UI components
  - [ ] Implement basic API integration
  - [ ] Add unit, component, and E2E tests (Jest, React Testing Library, Playwright)
6. CI/CD & Security
  - [ ] Set up GitHub Actions workflows (build, test, lint, scan)
  - [ ] Integrate Trivy for container scanning
  - [ ] Configure secrets management
  - [ ] Set up basic testing pipeline
  - [ ] Add pre-commit hooks for linting/formatting
