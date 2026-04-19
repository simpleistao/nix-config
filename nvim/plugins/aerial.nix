{ pkgs, ... }:
{
  plugins.aerial = {
    enable = true;
    settings = {
      # Use both LSP and Treesitter as backends
      backends = [ "lsp" "treesitter" ];
      # Show the symbol tree on the right
      layout = {
        min_width = 30;
        default_direction = "right";
      };
      # Close aerial when it's the last window open
      close_on_select = false;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action = "<cmd>AerialToggle!<CR>";
      options = { desc = "Toggle Aerial (Outline)"; };
    }
    {
      mode = "n";
      key = "{";
      action = "<cmd>AerialPrev<CR>";
      options = { desc = "Prev Symbol"; };
    }
    {
      mode = "n";
      key = "}";
      action = "<cmd>AerialNext<CR>";
      options = { desc = "Next Symbol"; };
    }
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>Telescope aerial<CR>";
      options = { desc = "Telescope aerial"; };
    }
  ];
}
