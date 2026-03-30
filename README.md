# Jalsoochak Devops

This repository contains the infrastructure and deployment configurations for the Jalsoochak project.

## Deployment Guide (Dev Server)

This guide outlines the steps to deploy the Jalsoochak services to the development server.

### Prerequisites

Ensure you have the following tools installed:
- `kubectl`
- `helm` (≥3.x)
- `helmfile` (≥1.0, tested on **1.4.x**)
- `sops`
- `age`

> **Note:** Helmfile 1.x uses `.yaml.gotmpl` files and requires an `environments:` block for template variable resolution. The helmfiles in this repo (`*.yaml.gotmpl`) are compatible with helmfile ≥1.0.

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

#### 1. Deploy Postgres & Minio
```bash
helmfile apply -f postgres-helmfile.yaml.gotmpl
```
```bash
elmfile apply -f jalsoochak-helmfile.yaml.gotmpl --selector name=minio
```
Note: Postgres and minio can be deployment outside cluster.

#### 2. Create Secret and ConfigMap
Before running `helmfile apply`, Update minio and postgres credential in secrets
create the necessary Kubernetes secrets and configmaps:

```bash
# Apply ConfigMap
kubectl apply -f charts/environments/dev-cm.yaml

# Decrypt and apply Secrets
sops -d charts/environments/dev-secret.yaml | kubectl apply -f -
```

#### 3. Deploy Cronjob
To deploy the cronjob that pulls the latest AWS ECR credentials, first update the schedule to run every minute for the initial credential fetch:
```bash
# Temporarily set schedule: "* * * * *" before applying
kubectl apply -f charts/cronjob/ecr-cred-helper.yaml
```
> **Note:** Revert the schedule back to `"0 */6 * * *"` after the initial run.

#### 4. Deploy Services
To deploy the entire stack to the development environment:
```bash
helmfile apply -f jalsoochak-helmfile.yaml.gotmpl
```

This will:
- Load environment values from `charts/environments/dev-secret.yaml` and `charts/environments/dev.yaml` via the `environments.default` block.
- Deploy all releases defined in `jalsoochak-helmfile.yaml.gotmpl`.

#### Dry-run / Template Preview

To preview rendered manifests without applying:
```bash
helmfile template -f jalsoochak-helmfile.yaml.gotmpl
helmfile template -f postgres-helmfile.yaml.gotmpl
```

### Verification

After deployment, verify the status of the pods:
```bash
kubectl get pods
```

Check the ingress status to ensure services are accessible:
```bash
kubectl get ingress
```
