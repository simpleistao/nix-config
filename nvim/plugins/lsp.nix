{ pkgs, ... }: {
  plugins = [ ];
  lua = ''
    -- LSP keymaps and setup
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local bufnr = ev.buf
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        
        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

        -- Diagnostic navigation
        map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("n", "gl", vim.diagnostic.open_float, "Open diagnostic float")
      end,
    })

    -- LspInfo command
    vim.api.nvim_create_user_command("LspInfo", "checkhealth lsp", {})

    -- Setup servers with capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    vim.lsp.config("gopls", {
      cmd = { "${pkgs.gopls}/bin/gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      capabilities = capabilities,
    })
    vim.lsp.config("pyright", {
      cmd = { "${pkgs.pyright}/bin/pyright-langserver", "--stdio" },
      filetypes = { "python" },
      capabilities = capabilities,
    })
    vim.lsp.enable({"gopls", "pyright"})
  '';
}
