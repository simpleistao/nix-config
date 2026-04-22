{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.trouble-nvim ];
  lua = ''
    require("trouble").setup({})
    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
  '';
}
