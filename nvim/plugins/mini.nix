{ pkgs, ... }:
{
  plugins.mini = {
    enable = true;
    modules = {
      diff = {
        view = {
          style = "number"; # Shows changed line numbers in the gutter
        };
      };
    };
  };

  # Toggle the diff overlay with <leader>gd
  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>lua MiniDiff.toggle_overlay()<CR>";
      options = { desc = "Git Overlay (mini.diff)"; };
    }
  ];
}
