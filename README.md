# Jalsoochak Devops

This repository contains the infrastructure and deployment configurations for the Jalsoochak project.

## Deployment Guide (Dev Server)

This guide outlines the steps to deploy the Jalsoochak V2 services to the development server.

### Prerequisites

Ensure you have the following tools installed:
- `kubectl`
- `helm`
- `helmfile`
- `sops`
- `age`

### Configuration

The deployment uses `helmfile` and `sops` for secrets management.

#### 1. Configure Age Key
The secrets in `infra/deploy-as-code/charts/environments/dev-secret.yaml` are encrypted using `sops` with an `age` key. Ensure you have the corresponding private key configured.

You can set the `SOPS_AGE_KEY` environment variable or ensure the key is present in its default location (`~/.config/sops/age/keys.txt`).

### Deployment Steps

Navigate to the deployment directory:
```bash
cd infra/deploy-as-code
```

#### 1. Pull Helm Chart Dependencies
Before deploying, ensure all dependencies are resolved:

#### 2. Deploy Services
To deploy the entire stack to the development environment:
```bash
helmfile apply -f jalsoochak-helmfile.yaml
```

This will:
- Decrypt the secrets in `charts/environments/dev-secret.yaml`.
- Merge them with the values in `charts/environments/jalsoochak-dev.yaml`.
- Deploy all releases defined in `jalsoochak-helmfile.yaml`.

### Verification

After deployment, you can verify the status of the pods:
```bash
kubectl get pods -n jalsoochak-dev
```

Check the ingress status to ensure services are accessible:
```bash
kubectl get ingress -n jalsoochak-dev
```
