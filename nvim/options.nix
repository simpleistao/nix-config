{ pkgs, ... }:
{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    tabstop = 4;
    expandtab = true;
    smartindent = true;
    termguicolors = true;
    autochdir = true;
  };

  programs.nixvim.colorschemes.tokyonight.enable = true;

  programs.nixvim.globals.mapleader = "\\";
}
