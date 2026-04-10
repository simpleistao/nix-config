{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./plugins/lualine.nix
    ./plugins/treesitter.nix
    ./plugins/cmp.nix
    ./plugins/lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
