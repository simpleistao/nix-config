{ pkgs, ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    
    # This enables the fast C-based sorter
    extensions.fzf-native.enable = true;

    # You can add keymaps directly inside the plugin config in Nixvim
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "find_git";
      "<leader>m" = "oldfiles";
    };
  };
}
