{ pkgs, ... }: {
  plugins = [ ]; # No plugin needed for native LSP in 0.11
  lua = ''
    -- Native LSP config (Neovim 0.11+)
    if vim.lsp.config then
      vim.lsp.config.enable('gopls', {})
      vim.lsp.config.enable('pyright', {})
    end

    -- Diagnostic navigation
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Open diagnostic float" })

    -- LSP keymaps
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      end,
    })

    -- LspInfo command
    vim.api.nvim_create_user_command('LspInfo', function()
      local clients = vim.lsp.get_clients()
      if #clients == 0 then
        print("No active LSP clients")
        return
      end
      for _, client in ipairs(clients) do
        print(string.format("Client: %s (ID: %d)", client.name, client.id))
      end
    end, {})
  '';
}
