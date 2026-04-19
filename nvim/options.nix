{ pkgs, ... }:
{
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    tabstop = 4;
    expandtab = true;
    smartindent = true;
    termguicolors = true;
    autochdir = true;
  };

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = false;
      integrations = {
        aerial = true;
        cmp = true;
        diffview = true;
        gitsigns = true;
        native_lsp.enabled = true;
        telescope.enabled = true;
        treesitter = true;
        mini.enabled = true;
      };
      # Force solid, row-filling background colors
      custom_highlights = ''
        function(cp)
          return {
            -- Row-filling backgrounds
            DiffAdd = { bg = "#2e4030", fg = "#a6e3a1", bold = true },
            DiffDelete = { bg = "#4a3131", fg = "#f38ba8", bold = true },
            DiffChange = { bg = "#313244", fg = "#89b4fa" },
            DiffText = { bg = "#45475a", fg = "#f9e2af", bold = true },

            -- Ensure Diffview uses these same solid blocks
            DiffAdded = { bg = "#2e4030", fg = "#a6e3a1" },
            DiffRemoved = { bg = "#4a3131", fg = "#f38ba8" },
          }
        end
      '';
    };
  };

  globals.mapleader = "\\";

  keymaps = [
    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabnew<CR>";
      options = { desc = "New Tab"; };
    }
  ];
}
