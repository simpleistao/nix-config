{ pkgs, ... }: {
  home.username = "tomzhi";
  home.homeDirectory = "/home/tomzhi";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    docker
    fd
    fzf
    gh
    go
    gopls
    htop
    nodejs
    pyright
    python3
    ripgrep
    wslu
  ];

  programs.home-manager.enable = true;

  # Git Configuration
  programs.git = {
    enable = true;
    settings = {
      alias = {
        s = "status";
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
      user = {
        name = "simpleistao";
        email = "simpleistao@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      # Use gh as the credential helper for GitHub
      credential."https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
      credential."https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
    };
    signing.format = "openpgp";
  };

  # Bash Configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      sl = "readlink -f";
      hms = "home-manager switch --flake ~/.config/home-manager --impure";
      g = "git";
      ll = "ls -lah";
      nv = "nvim";
    };
  };

  # Neovim (NixVim) Configuration
  programs.nixvim = {
    enable = true;
    defaultEditor = true; # Makes 'nvim' your default editor ($EDITOR)

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      smartindent = true;
      termguicolors = true;
    };

    colorschemes.tokyonight.enable = true;

    globals.mapleader = " ";

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
          ];
        };
      };

      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          pyright.enable = true;
        };
        keymaps.lspBuf = {
          gd = "definition";
          K = "hover";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
        };
      };
    };
  };
}
