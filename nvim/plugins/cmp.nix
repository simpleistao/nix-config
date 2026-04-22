{ pkgs, ... }: {
  plugins = [ 
    pkgs.vimPlugins.nvim-cmp
    pkgs.vimPlugins.cmp-nvim-lsp
    pkgs.vimPlugins.cmp-buffer
    pkgs.vimPlugins.cmp-path
    pkgs.vimPlugins.luasnip
    pkgs.vimPlugins.cmp_luasnip
  ];
  lua = ''
    local cmp = require'cmp'
    local luasnip = require'luasnip'

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'buffer', priority = 500 },
        { name = 'path', priority = 250 },
      })
    })
  '';
}
