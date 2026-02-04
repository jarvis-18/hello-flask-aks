# Hello Flask on AKS via GitHub Actions + ACR

Simple Python Flask app containerized with Docker, built in GitHub Actions, pushed to Azure Container Registry (ACR), and deployed to Azure Kubernetes Service (AKS).

## Architecture

- Flask app → Docker image
- GitHub Actions builds image (no local Docker, no ACR Tasks)
- Push to ACR
- Deploy to AKS (Deployment + LoadBalancer Service)

## Prerequisites

- Azure subscription
- ACR created (e.g., `tejasacrdemo`)
- AKS cluster created and **attached to ACR**:
  ```bash
  az aks update -g rg-aks-demo -n aks-hello-flask --attach-acr tejasacrdemo
