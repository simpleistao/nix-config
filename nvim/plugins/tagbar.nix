{ pkgs, ... }:
{
  programs.nixvim.plugins.tagbar = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>TagbarToggle<CR>";
      options = { desc = "Toggle Tagbar"; };
    }
  ];
}
