{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      pyright.enable = true;
    };
    
    # These handle the "E" errors and warnings
    keymaps.diagnostic = {
      "gl" = "open_float";
      "[" = "goto_prev";
      "]" = "goto_next";
    };

    # These handle code navigation
    keymaps.lspBuf = {
      "gd" = "definition";    # Jump to where it's defined
      "gr" = "references";    # Jump to all callers
      "gi" = "implementation"; # Jump to implementation (useful for Go interfaces!)
      "gt" = "type_definition";
      "K" = "hover";
      "<leader>rn" = "rename";  # Ensure quotes are here
      "<leader>ca" = "code_action"; # Ensure quotes are here
    };
  };
}
