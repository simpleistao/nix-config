{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.yanky-nvim ];
  lua = ''
    require("yanky").setup({})
    vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousAnyEntry)")
    vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextAnyEntry)")
  '';
}
