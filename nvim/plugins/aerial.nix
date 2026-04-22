{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.aerial-nvim ];
  lua = ''
    require('aerial').setup({
      backends = { "lsp", "treesitter" },
      layout = {
        min_width = 30,
        default_direction = "right",
      },
      close_on_select = false,
    })
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial (Outline)" })
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { desc = "Prev Symbol" })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { desc = "Next Symbol" })
    vim.keymap.set("n", "<leader>sa", "<cmd>Telescope aerial<CR>", { desc = "Telescope aerial" })
  '';
}
