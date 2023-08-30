# DevOps Test Infra

## Overview

This repository contains the infrastructure-as-code (IaC) configurations for the technical test for the DevOps Engineer role. The infrastructures are managed via Terraform and Kubernetes YAML files for Node.js app deployment.

## Table of Contents

1. [Files](#files)
2. [Getting Started](#getting-started)
3. [Usage](#usage)

## Files

- `infra/vpc`: Contains Terraform files for setting up a VPC.
- `infra/gke-cluster`: Contains Terraform files for setting up a Google Kubernetes Engine (GKE) cluster.
- `k8s`: Contains Kubernetes YAML files for deploying Node.js app and StatsD/Graphite service.

### Terraform Files for VPC and GKE Cluster

- `infra/vpc/main.tf`: Terraform configurations for provisioning a VPC.
- `infra/vpc/variables.tf`: Variable definitions for the VPC setup.
- `infra/vpc/outputs.tf`: Output variables such as VPC name, which are essential for GKE configurations.
- `infra/gke-cluster/main.tf`: Terraform configurations for provisioning a GKE cluster.
- `infra/gke-cluster/variables.tf`: Variable definitions for the GKE setup.
- `infra/gke-cluster/outputs.tf`: Output variables from the GKE setup.

Note: Make sure to capture the output from the VPC setup to edit the `main.tf` file in the `gke-cluster` folder.

### Kubernetes Manifests

- `namespace.yaml`: Namespace where the services will reside.
- `nodeapp-config.yaml`: ConfigMap manifest for the Node.js app.
- `nodeapp-deployment.yaml`: Deployment manifest for the Node.js app.
- `statsd-deployment.yaml`: Deployment manifest for StatsD and Graphite service.
- `statsd-service.yaml`: Service manifest for StatsD.
- `graphite-service.yaml`: Service manifest for Graphite (Graphite GUI).

## Getting Started

Clone the repository.

```bash
git clone https://github.com/mmayyyy/devops-test-infra
```

## Usage

### Provisioning a VPC with Terraform

```bash
cd devops-test-infra/infra/vpc
terraform init
terraform plan
terraform apply -auto-approve
```

### Using VPC Outputs for GKE Setup

Display the VPC outputs and use in `infra/gke-cluster/main.tf`.

```bash
terraform output
```

### Provisioning a GKE cluster with Terraform

```bash
cd devops-test-infra/infra/gke-cluster
terraform init
terraform plan
terraform apply -auto-approve
```

### Deploying an Application with Kubernetes

```bash
kubectl apply -f namespace.yaml
kubectl apply -f .
```

### Accessing the Application

1. Retrieve the external IP address for the Graphite service.

```bash
kubectl get svc graphite-service -n devops-test
```

2. Open your browser and navigate to `http://<IP-ADDRESS>` to access the Graphite UI.