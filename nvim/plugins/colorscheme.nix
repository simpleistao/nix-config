{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.gruvbox ];
  lua = ''
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  '';
}
