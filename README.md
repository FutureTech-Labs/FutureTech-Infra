<div align="center">

# FutureTech Infrastructure

**Production-grade infrastructure, deployment, and monitoring configuration for the FutureTech platform**

[![Docker Compose](https://img.shields.io/badge/Docker_Compose-Orchestration-2496ED?style=flat-square&logo=docker)](https://www.docker.com/)
[![NGINX](https://img.shields.io/badge/NGINX-Reverse_Proxy-009639?style=flat-square&logo=nginx)](https://nginx.org/)
[![AWS EC2](https://img.shields.io/badge/AWS-EC2-FF9900?style=flat-square&logo=amazonaws)](https://aws.amazon.com/ec2/)
[![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?style=flat-square&logo=prometheus)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?style=flat-square&logo=grafana)](https://grafana.com/)

</div>

---

## Overview

`futuretech-infra` contains the infrastructure, deployment, reverse proxy, and monitoring configuration used to run the **FutureTech Computer Shop Management System** in a production-style environment.

The repository provides a centralized infrastructure layer for orchestrating application services, routing traffic through NGINX, automating deployments through GitHub Actions, and monitoring server health using Prometheus and Grafana.

This repository is one of three in a multi-repository architecture:

| Repository              | Responsibility                                                           |
| ----------------------- | ------------------------------------------------------------------------ |
| `futuretech-frontend`   | Next.js 16 frontend application                                          |
| `futuretech-backend`    | Express.js REST API, business logic, database integration                |
| [`futuretech-infra`](.) | Infrastructure, deployment, reverse proxy, monitoring, and orchestration |

---

## Tech Stack

| Layer              | Technology     | Purpose                                  |
| ------------------ | -------------- | ---------------------------------------- |
| Cloud Platform     | AWS EC2        | Application hosting and deployment       |
| Containerization   | Docker         | Containerized application runtime        |
| Orchestration      | Docker Compose | Multi-container service management       |
| Reverse Proxy      | NGINX          | Request routing and traffic management   |
| CI/CD              | GitHub Actions | Automated build and deployment workflows |
| Container Registry | Docker Hub     | Container image storage and distribution |
| Monitoring         | Prometheus     | Metrics collection and storage           |
| Visualization      | Grafana        | Metrics dashboards and observability     |
| Host Monitoring    | Node Exporter  | Linux system metrics collection          |

---

## Features

### Infrastructure & Deployment

- Production-style AWS EC2 deployment
- Multi-container Docker Compose architecture
- Infrastructure separated into a dedicated repository
- Environment-based configuration management
- Automated image updates through CI/CD pipelines

### Reverse Proxy & Networking

- NGINX reverse proxy configuration
- Internal Docker service communication
- Centralized traffic routing
- Simplified frontend/backend access through a single endpoint
- Reduced exposure of internal services

### Monitoring & Observability

- Prometheus metrics collection
- Grafana dashboards and visualization
- Node Exporter host monitoring
- CPU, Memory, Disk, and Network monitoring
- Infrastructure observability stack

### CI/CD Automation

- Automated Docker image builds
- Docker Hub image publishing
- Automatic deployment to AWS EC2
- SSH-based deployment workflows
- Service recreation with zero manual image updates

### Security & Operations

- Security Group controlled access
- SSH key-based authentication
- Environment variable configuration
- Container isolation through Docker networking
- Monitoring and operational visibility

---

## Project Structure

```bash
futuretech-infra/
├── compose/
│   ├── docker-compose.yml
│   └── docker-compose.dev.yml
│
├── monitoring/
│   └── prometheus.yml
│
├── nginx/
│   └── nginx.conf
│
├── .env.example
├── .dockerignore
├── .gitignore
└── README.md
```

---

## Infrastructure Architecture

```text
                     GitHub Actions
                            │
                            ▼
                       Docker Hub
                            │
                            ▼
                     AWS EC2 Instance
                            │
                            ▼
                    ┌──────────────┐
                    │    NGINX     │
                    │ Reverse Proxy│
                    └──────┬───────┘
                           │
         ┌─────────────────┴─────────────────┐
         ▼                                   ▼
 ┌───────────────┐                  ┌───────────────┐
 │   Frontend    │                  │    Backend    │
 │   Next.js 16  │                  │ Express.js API│
 └───────────────┘                  └───────┬───────┘
                                            │
                                            ▼
                                      MongoDB Atlas
```

---

## Monitoring Architecture

```text
AWS EC2 Instance
        │
        ▼
  Node Exporter
        │
        ▼
   Prometheus
        │
        ▼
    Grafana
```

---

## Local Infrastructure Setup

### Prerequisites

- Docker
- Docker Compose
- AWS EC2 Instance (for production deployment)
- Docker Hub Account
- MongoDB Atlas Database

### Start Infrastructure

```bash
docker compose -f compose/docker-compose.yml up -d
```

### View Running Containers

```bash
docker ps
```

### View Container Logs

```bash
docker logs -f <container_name>
```

### Stop Infrastructure

```bash
docker compose -f compose/docker-compose.yml down
```

---

## Environment Configuration

Create the required environment files before deployment.

### Frontend Environment

```env
PORT=3000

INTERNAL_API_URL=http://backend:5000/api

JWT_VERIFY_SECRET=
```

### Backend Environment

```env
PORT=5000

MONGODB_URI=

JWT_SECRET=

NODE_ENV=production

FRONTEND_URL=
```

---

## Deployment Workflow

```text
Developer
    │
    ▼
Push Code
    │
    ▼
GitHub Actions CI
    │
    ▼
Build Docker Image
    │
    ▼
Push to Docker Hub
    │
    ▼
GitHub Actions CD
    │
    ▼
SSH into AWS EC2
    │
    ▼
docker compose pull
    │
    ▼
docker compose up -d
```

---

## Monitoring Endpoints

| Service       | Endpoint                      |
| ------------- | ----------------------------- |
| Application   | http://SERVER_IP              |
| Prometheus    | http://SERVER_IP:9090         |
| Grafana       | http://SERVER_IP:3001         |
| Node Exporter | http://SERVER_IP:9100/metrics |

---

## Production Considerations

- Infrastructure isolated into a dedicated repository
- Fully Dockerized deployment workflow
- Automated CI/CD pipelines through GitHub Actions
- NGINX-based reverse proxy architecture
- Internal Docker networking between services
- Monitoring and observability with Prometheus and Grafana
- Scalable foundation for future Kubernetes migration
- Infrastructure designed to mirror real-world deployment practices

---

## Related Repositories

- **futuretech-frontend** — Next.js 16 frontend application
- **futuretech-backend** — Express.js REST API and business services

---

<div align="center">
  <sub>Built as part of the FutureTech Computer Shop Management System and extended to explore modern DevOps, deployment automation, monitoring, and infrastructure engineering practices.</sub>
</div>
