{ pkgs, lib, ... }: {
  home.username = "tomzhi";
  home.homeDirectory = "/home/tomzhi";
  home.stateVersion = "24.11";

  imports = [
  ];

  home.packages = with pkgs; [
    (import ./nvim { inherit pkgs lib; })
    # Docker client (Daemon should be managed via 'apt' on Ubuntu/WSL for systemd integration)
    # Install daemon: sudo apt install docker-ce
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
    k3d         # Ephemeral K8s clusters in Docker
    k9s         # Terminal UI for K8s
    terraform
    tmux
    yq
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
      difftool.prompt = false; # Optional: skips the "Launch nvimdiff?" prompt
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
        lg = "log -1 HEAD";
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
    initExtra = ''
      export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    '';
    shellAliases = {
      sl = "readlink -f";
      hms = "home-manager switch --flake ~/.config/home-manager --impure";
      g = "git";
      gp = "git push -u origin main";
      ll = "ls -lah";
      nv = "nvim";
    };
  };
}
