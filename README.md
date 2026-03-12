# Jalsoochak Devops

This repository contains the infrastructure and deployment configurations for the Jalsoochak project.

## Deployment Guide (Dev Server)

This guide outlines the steps to deploy the Jalsoochak services to the development server.

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

To decrypt the secrets file (e.g., for troubleshooting or before a manual apply):
```bash
sops -d -i infra/deploy-as-code/charts/environments/dev-secret.yaml
```

### Deployment Steps

Navigate to the deployment directory:
```bash
cd infra/deploy-as-code
```

#### 1. Create Namespace
Ensure the target namespace exists:
```bash
kubectl create namespace jalsoochak-dev --dry-run=client -o yaml | kubectl apply -f -
```

#### 2. Create Secret and ConfigMap
Before running `helmfile apply`, create the necessary Kubernetes secrets and configmaps:

```bash
# Apply ConfigMap
kubectl apply -f charts/environments/dev-cm.yaml

# Decrypt and apply Secrets
sops -d charts/environments/dev-secret.yaml | kubectl apply -f -
```

#### 3. Deploy Services
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
