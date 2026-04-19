{ pkgs, ... }:
{
  plugins.diffview = {
    enable = true;
    settings = {
      enhanced_diff_hl = true;
      view = {
        merge_tool = {
          layout = "diff3_mixed";
          disable_diagnostics = true;
        };
      };
    };
  };

  keymaps = [
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
