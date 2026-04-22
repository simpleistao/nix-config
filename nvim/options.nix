{ pkgs, ... }:
''
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.expandtab = true
  vim.opt.smartindent = true
  vim.opt.termguicolors = true
  vim.opt.autochdir = true
  vim.opt.updatetime = 500

  vim.g.mapleader = "\\"

  -- Tabs
  vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
  
  -- Edit config
  vim.keymap.set("n", "<leader>vc", "<cmd>e " .. vim.env.MYVIMRC .. "<CR>", { desc = "Edit config" })

  -- Colorscheme
  vim.cmd.colorscheme("gruvbox")

  -- Black hole register for delete/change
  vim.keymap.set({ "n", "v" }, "d", '"_d')
  vim.keymap.set({ "n", "v" }, "c", '"_c')
  vim.keymap.set({ "n", "v" }, "D", '"_D')
  vim.keymap.set({ "n", "v" }, "C", '"_C')
''
