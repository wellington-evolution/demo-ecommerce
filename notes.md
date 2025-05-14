# Chosen Technologies

- Frontend: Next.js (TypeScript)
- Backend: Django (Python)
- Database: PostgreSQL
- Service Discovery & API Gateway: Traefik
- Observability: Grafana, Prometheus, Loki, Tempo, Promtail, Blackbox Exporter
- Authentication: JWT, Argon2 (password hashing)
- Testing: Jest (unit testing), Playwright (component and acceptance testing), MSW (frontend); pytest, pytest-django, pytest-asyncio, Factory Boy, Faker (backend)
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
  - [ ] Add unit, component, and acceptance tests (Jest, Playwright Component Testing, Playwright + Cucumber)
6. CI/CD & Security
  - [ ] Set up GitHub Actions workflows (build, test, lint, scan)
  - [ ] Integrate Trivy for container scanning
  - [ ] Configure secrets management
  - [ ] Set up basic testing pipeline
  - [ ] Add pre-commit hooks for linting/formatting

---

DRAFT

Some requirements:

* CRUD Item;
* CRUD Cart;
* CRUD Order;
* CRUD Account;
* CRUD Payment;

* Order flow:
  * User accesses the Items Page (This page displays all items);
  * User can adds one or more items to cart though the "Add to Cart" buttom;
  * User can open (visualise) the cart through the "View the Cart" button (This will opens the Order Page);
    * On Order Page, the user can increase or decrease the quantity of each item on the cart;
    * On Order Page, the user can remove items from the cart;
    * On Order Page, the user can attach a cupom code to get discounts;
    * On Order Page, the user can proceed with the order by clicking "Buy" button;
      * This will send the user to Payment Page;
      * On Payment Page, the user can select the payment mode (pix, credit cart or invoice);
      * On Payment Page the user can confirm the payment by clicking "Confirm" buttom;
    * On Order Page, the user can return to Items Page by clicking "Keep Buying" buttom;
  * On Items Page, the user can select (click) on an item, this will opens the Item Details Page;
    * On Item Details Page, the user can visualize all data about such item;
    * On Item Details Page, the user can add such item to cart by clicking "Add to Cart" buttom;
    * On Item Details Page, the user can in one sigle operation add such item to cart and opens Order Page by clicking "Buy" buttom;

Some relations:

Item many-to-one Cart; Item compounds Cart;
Cart one-to-one Order; Cart compounds Order;
Payment one-to-one Order; Payment compounds Order;
Account one-to-many Order; Account compouds Order;

---

## BDD + TDD Draft for Frontend Development

### 1. Tools & Libraries
- **BDD:** [Cucumber.js](https://github.com/cucumber/cucumber-js) (Gherkin syntax for feature files)
- **TDD/Unit Testing:** [Jest](https://jestjs.io/) (unit tests, coverage)
- **Component Testing:** Playwright Component Testing
- **Acceptance Testing:** [Playwright](https://playwright.dev/) + Cucumber.js
- **Mocking API:** [MSW (Mock Service Worker)](https://mswjs.io/)
- **Linting/Formatting:** ESLint, Prettier

### 2. BDD Process
- Write user stories and acceptance criteria in Gherkin (`.feature` files) for each major flow (e.g., Add to Cart, Checkout, Payment).
- Example (features/cart.feature):
  ```gherkin
  Feature: Cart management
    Scenario: Add item to cart from Items Page
      Given I am on the Items Page
      When I click "Add to Cart" on an item
      Then the item should appear in my cart
  ```
- Use [jest-cucumber](https://github.com/bencompton/jest-cucumber) to bind Gherkin steps to test code.

### 3. TDD Process
- For each feature:
  1. Write failing tests (unit/component/acceptance) for the UI and logic.
  2. Implement the minimal code to pass the tests.
  3. Refactor and improve code, keeping tests green.
  4. Use MSW to mock backend API responses for frontend tests.

### 4. Suggested Directory Structure
```
frontend/web/
  src/
    app/
    components/
    features/
      cart/
        Cart.feature
        Cart.test.tsx
      item/
        Item.feature
        Item.test.tsx
  tests/
    support/
  mocks/
    handlers.ts
    server.ts
```

### 5. Example Workflow
1. **Write a Gherkin feature** for "Add to Cart".
2. **Write a failing component test** for Cart UI.
3. **Implement Cart component** to pass the test.
4. **Write acceptance test** for the full add-to-cart flow using Playwright + Cucumber.js.
5. **Mock API** with MSW for isolated frontend testing.
6. **Repeat** for each feature (Order, Payment, etc).

### 6. CI Integration
- Run all tests (unit, component, acceptance) in CI pipeline.
- Enforce coverage and linting thresholds.

### 7. Optional Tools
- [Storybook](https://storybook.js.org/) for UI component development and visual BDD.
- [Allure](https://docs.qameta.io/allure/) for test reporting.

---
