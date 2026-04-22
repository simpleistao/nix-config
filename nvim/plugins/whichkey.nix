{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.which-key-nvim ];
  lua = ''
    require("which-key").setup({})
  '';
}
