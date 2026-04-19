{ ... }:
{
  # This tells Neovim to show help/diagnostics when the cursor stays still
  autoCmd = [
    {
      event = [ "CursorHold" ];
      pattern = [ "*" ];
      callback = { __raw = ''
        function()
          -- Only show if we aren't in a special window (like the hover window itself)
          for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
              return
            end
          end
          -- Open the hover help
          vim.lsp.buf.hover({ focusable = false })
        end
      ''; };
    }
  ];

  # This makes the "hold" trigger faster (default is 4000ms, which is too slow)
  opts.updatetime = 500; # 0.5 seconds
}
