{ pkgs, ... }:
{
  programs.nixvim.plugins.diffview = {
    enable = true;
    # You can add specific settings here later, 
    # but the defaults are very sensible.
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<CR>";
      options = { desc = "Git Diffview Open"; };
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>DiffviewFileHistory %<CR>";
      options = { desc = "Git File History"; };
    }
    {
      mode = "n";
      key = "<leader>gx";
      action = "<cmd>DiffviewClose<CR>";
      options = { desc = "Git Diffview Close"; };
    }
  ];
}
