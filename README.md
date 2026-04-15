# ❄️ Tom's Nix Home Manager Configuration

This directory contains the complete declarative configuration for my WSL development environment. It manages my installed software, dotfiles, and Neovim editor using **Nix**, **Home Manager**, and **NixVim**.

## 🚀 Quick Start

To apply changes after modifying `home.nix`:

```bash
cd ~/.config/home-manager
home-manager switch --flake . --impure
```

## 💻 Setup on a New Machine

Follow these steps to replicate this environment on a fresh install:

1. **Install Nix**:
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```

2. **Enable Flakes**:
   Ensure `~/.config/nix/nix.conf` contains:
   ```text
   experimental-features = nix-command flakes
   ```

3. **Clone this Repository**:
   ```bash
   git clone https://github.com/simpleistao/nix-config.git ~/.config/home-manager
   ```

4. **Bootstrap Home Manager**:
   Run the initial switch to install everything:
   ```bash
   cd ~/.config/home-manager
   nix run github:nix-community/home-manager -- switch --flake . --impure -b backup
   ```

## 📂 Structure

- `flake.nix`: Defines the software sources (Nixpkgs, Home Manager, NixVim).
- `home.nix`: The "Master List" of packages and configurations.
- `flake.lock`: Pins exact versions of all software for perfect reproducibility.

## 🛠️ Included Software

### Languages & Runtimes
- **Go**: Full toolchain + `gopls`
- **Python**: Python 3 + `pyright`
- **Node.js**: Required for various LSPs and tools

### 🐳 Docker & Kubernetes Strategy
We use a **hybrid approach** to manage Docker on Ubuntu WSL:
- **Client (`docker`)**: Managed by **Nix** via `home.nix`.
- **Daemon (`docker-ce`)**: Managed by **`apt`** on the host Ubuntu system for stable systemd integration.
- **K8s Admin Tools**: `kubectl`, `helm`, and `k9s` are all Nix-managed.

See [K8S.md](./K8S.md) for detailed Kubernetes workflows, including local cluster management with `k3d`.

**🏗️ Ephemeral Clusters (k3d)**
To balance resource usage on a development laptop, we use **k3d** (k3s in Docker). This allows you to:
- Spin up a 3-node cluster in seconds for testing.
- Shut it down entirely when not in use to free up 100% of the RAM/CPU.
- Test production-grade Helm charts locally without the overhead of an "always-on" cluster.

## ✍️ Neovim (NixVim)

My Neovim is managed entirely via Nix using **NixVim**. This allows for a modular, declarative configuration where every plugin and setting is tracked by Nix.

### 🧩 Modular Configuration
The configuration is organized under the `nvim/` directory, where each major component or plugin has its own Nix file:
- `nvim/default.nix`: Main entry point, imports all other modules.
- `nvim/options.nix`: Editor options like line numbers, indentation, etc.
- `nvim/plugins/`: Directory containing individual plugin configurations (e.g., `lsp.nix`, `treesitter.nix`, `telescope.nix`).

## 🧹 Maintenance & Rollback

Nix keeps old "generations" so you can roll back if a change breaks something.

### 🔄 How to Rollback
If a configuration switch fails or causes issues, you can return to a previous state:

#### Option 1: Using `home-manager`
```bash
# List all generations
home-manager generations

# Roll back to the previous generation
home-manager generations --rollback
```

#### Option 2: Using `nix-env`
```bash
# List generations
nix-env --list-generations

# Roll back to the immediate previous version
nix-env --rollback

# Switch to a specific generation number
nix-env --switch-generation <number>
```

### 🗑️ Cleaning Up (Garbage Collection)
Nix is "pure," meaning it keeps everything it downloads in the `/nix/store` until you explicitly delete it. This includes temporary tools you run via `nix run nixpkgs#package`.

#### 1. Basic Cleanup
Removes temporary packages (like those from `nix run`) and orphaned dependencies that aren't part of any current configuration:
```bash
nix-collect-garbage
```

#### 2. Deep Cleanup (Delete Old Generations)
Removes all previous configuration versions and temporary files. **Note:** This deletes your ability to roll back.
```bash
# Deletes all generations except the current one
nix-collect-garbage -d
```

## Diff between versions
nix-shell -p nvd --run "nvd diff ~/.local/state/nix/profiles/profile-9-link ~/.local/state/nix/profiles/profile-11-link"

## 🔄 How to add new software

1. Search for a package at [search.nixos.org](https://search.nixos.org/packages).
2. Add the package name to the `home.packages` list in `home.nix`.
3. Run the `home-manager switch` command shown above (or use the `hms` alias).
