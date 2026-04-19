{ ... }:
{
  # This tells Neovim to show documentation when the cursor stays still
  programs.nixvim.autoCmd = [
    {
      event = [ "CursorHold" ];
      pattern = [ "*" ];
      callback = { __raw = ''
        function()
          -- Only show if we aren't already in a special window (like the hover window itself)
          for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
              return
            end
          end
          -- Open the hover documentation
          vim.lsp.buf.hover({ focusable = false })
        end
      ''; };
    }
  ];

  # 1000ms (1 second) pause before docs appear
  programs.nixvim.opts.updatetime = 1000;
}
