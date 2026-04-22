{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.diffview-nvim ];
  lua = ''
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })
    vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File History" })
    vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<CR>", { desc = "Diffview Close" })
  '';
}
