# ❄️ Tom's Nix Home Manager Configuration

This directory contains the complete declarative configuration for my WSL development environment. It manages my installed software, dotfiles, and Neovim editor using **Nix**, **Home Manager**, and **NixVim**.

## 🚀 Quick Start

To apply changes after modifying `home.nix`:

```bash
cd ~/.config/home-manager
home-manager switch --flake . --impure
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

### CLI Utilities
- `ripgrep` (rg): Fast searching
- `fd`: User-friendly `find` replacement
- `fzf`: Fuzzy finder
- `htop`: Interactive process viewer
- `git`: Version control (configured in `home.nix`)

## ✍️ Neovim (NixVim)

My Neovim is managed entirely via Nix. Key features:
- **Theme**: TokyoNight
- **LSP**: Built-in support for Go and Python
- **Autocomplete**: `nvim-cmp` with LSP and buffer sources
- **Syntax**: `treesitter` for advanced highlighting

### Keybindings
- `gd`: Go to Definition
- `K`: Hover Documentation
- `<leader>rn`: Rename Symbol
- `<leader>ca`: Code Action
- `Leader`: Spacebar

## 🧹 Maintenance

Nix keeps old "generations" so you can roll back. To free up disk space by deleting old versions:

```bash
nix-collect-garbage -d
```

## 🔄 How to add new software

1. Search for a package at [search.nixos.org](https://search.nixos.org/packages).
2. Add the package name to the `home.packages` list in `home.nix`.
3. Run the `home-manager switch` command shown above.
