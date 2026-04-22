{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.mini-nvim ];
  lua = ''
    require('mini.pairs').setup()
  '';
}
