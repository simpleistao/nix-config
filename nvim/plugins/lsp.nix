{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      pyright.enable = true;
    };
    keymaps.lspBuf = {
      gd = "definition";
      K = "hover";
      "<leader>rn" = "rename";
      "<leader>ca" = "code_action";
    };
  };
}
