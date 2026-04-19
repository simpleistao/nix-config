{ pkgs, inputs, ... }: {
  home.username = "tomzhi";
  home.homeDirectory = "/home/tomzhi";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # Use the standalone nvim package built by our local flake
    inputs.nvim-flake.packages.${pkgs.system}.default

    # Docker client
    docker
    fd
    fzf
    gemini-cli
    gh
    go
    go-jsonnet
    gopls
    htop
    jq
    nodejs
    opencode
    pyright
    python3
    ripgrep
    # Kubernetes & DevOps Tools
    kubectl
    kubernetes-helm
    k3d
    k9s
    terraform
    tmux
    yq
    wslu
  ];

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Git Configuration
  programs.git = {
    enable = true;
    settings = {
      diff.tool = "nvimdiff";
      difftool.prompt = false;
      "difftool \"nvimdiff\"" = {
        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
      };
      alias = {
        d = "difftool";
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
      credential."https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
      credential."https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
    };
    signing.format = "openpgp";
  };

  # Bash Configuration
  programs.bash = {
    enable = true;
    initExtra = ''
      export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    '';
    shellAliases = {
      sl = "readlink -f";
      hms = "home-manager switch --flake ~/.config/home-manager --impure";
      g = "git";
      gp = "git push -u origin main";
      ls = "ls --color=auto";
      ll = "ls -lah --color=auto";
      nv = "nvim";
    };
  };
}
