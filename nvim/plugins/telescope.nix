{ pkgs, ... }:
{
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.plugins.telescope = {
    enable = true;
    
    # This enables the fast C-based sorter
    extensions.fzf-native.enable = true;

    # You can add keymaps directly inside the plugin config in Nixvim
    keymaps = {
      "<leader>sf" = "find_files";
      "<leader>sg" = "git_files";
      "<leader>sw" = "grep_string";
      "<leader>m" = "oldfiles";
    };
  };
}
