{ pkgs, ... }: {
  plugins = [ (pkgs.vimPlugins.nvim-treesitter.withAllGrammars) ];
  lua = ''
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      indent = { enable = true },
    })
  '';
}
