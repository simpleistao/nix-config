{ pkgs, ... }:
{
  programs.nixvim.plugins.trouble = {
    enable = true;
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = { desc = "Diagnostics (Trouble)"; };
    }
  ];
}
