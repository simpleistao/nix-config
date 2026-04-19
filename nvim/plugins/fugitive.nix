{ pkgs, ... }:
{
  programs.nixvim.plugins.fugitive = {
    enable = true;
  };

  # Optional: Handy keybindings for fugitive
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
      options = { desc = "Git Status"; };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Git blame<CR>";
      options = { desc = "Git Blame"; };
    }
  ];
}
