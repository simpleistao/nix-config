# ☸️ Kubernetes Development Workflow

This document outlines the professional Kubernetes workflow using the tools managed by Nix in this repository.

## 🛠️ Toolchain
These tools are defined in `home.nix` and kept in sync via Home Manager:
- **`k3d`**: Local cluster management (k3s in Docker).
- **`kubectl`**: The Kubernetes CLI.
- **`helm`**: Package management for Kubernetes.
- **`k9s`**: Terminal UI for cluster management.

---

## 🚀 Cluster Lifecycle

### Create a Development Cluster
Create a multi-node cluster that mirrors production architecture without the overhead of a full VM:
```bash
# Create a 3-node cluster (1 control-plane, 2 workers)
k3d cluster create dev-cluster --servers 1 --agents 2
```

### Stop/Start Cluster (Save Resources)
When not actively developing, stop the containers to free up RAM:
```bash
k3d cluster stop dev-cluster
k3d cluster start dev-cluster
```

### Delete Cluster (Clean Slate)
```bash
k3d cluster delete dev-cluster
```

---

## 📦 Service Management (Helm)

### Example: Installing Prometheus
A common task for a K8s admin is setting up monitoring:

1. **Add the Repository**:
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

2. **Install to a Namespace**:
   ```bash
   helm install prometheus prometheus-community/prometheus \
     --namespace monitoring \
     --create-namespace
   ```

3. **Verify Deployment**:
   Use **`k9s`** to visually inspect the pods starting up, or use kubectl:
   ```bash
   kubectl get pods -n monitoring
   ```

---

## 🔍 Debugging & Access

### Port Forwarding
Access services running inside the cluster from your Windows browser:
```bash
# Forward Prometheus UI to localhost:9090
kubectl port-forward -n monitoring svc/prometheus-server 9090:80
```

### Terminal UI (k9s)
The most efficient way to manage your local cluster. Keybindings:
- `:pod`: View pods
- `:ns`: View namespaces
- `l`: View container logs
- `s`: Shell into container
- `0`: Show all namespaces

---

## 💡 Best Practices for WSL
- **Resources**: If WSL RAM usage is too high, limit it in `%USERPROFILE%\.wslconfig`.
- **Docker**: Ensure the Docker daemon (managed via `apt`) is running before using `k3d`.
- **Contexts**: `k3d` automatically updates your `~/.kube/config`. Use `kubectl config get-contexts` to switch between clusters.
