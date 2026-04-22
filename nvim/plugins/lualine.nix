{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.lualine-nvim ];
  lua = ''
    require('lualine').setup()
  '';
}
