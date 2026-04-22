{ pkgs, ... }: {
  plugins = [ pkgs.vimPlugins.diffview-nvim ];
  lua = ''
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    })
  '';
}
