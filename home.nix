{ pkgs, ... }: {
  home.username = "tomzhi";
  home.homeDirectory = "/home/tomzhi";
  home.stateVersion = "24.11";

  imports = [
    ./nvim
  ];

  home.packages = with pkgs; [
    docker
    fd
    fzf
    gh
    go
    gopls
    htop
    nodejs
    opencode
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
      gp = "git push -u origin main";
      ll = "ls -lah";
      nv = "nvim";
    };
  };
}
