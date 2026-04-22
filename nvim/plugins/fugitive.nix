{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.vim-fugitive ];
  lua = ''
    vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git Blame" })
  '';
}
