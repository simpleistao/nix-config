{ pkgs, ... }: {
  plugins = [ 
    pkgs.vimPlugins.telescope-nvim
    pkgs.vimPlugins.telescope-fzf-native-nvim
    pkgs.vimPlugins.nvim-web-devicons
    pkgs.vimPlugins.plenary-nvim
  ];
  lua = ''
    require("telescope").setup({
      extensions = {
        fzf = {}
      }
    })
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "Git files" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Grep string" })
    vim.keymap.set("n", "<leader>m", builtin.oldfiles, { desc = "Old files" })
    
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
    vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Search doc symbols" })
    vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Search workspace symbols" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
  '';
}
