{ pkgs, lib, ... }:
let
  # Import base configs as bare strings
  options = import ./options.nix { inherit pkgs; };
  autocmds = import ./autocmds.nix { inherit pkgs; };

  # Plugins from the plugins directory, filtered by type and suffix
  pluginsDir = ./plugins;
  pluginFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) (builtins.readDir pluginsDir);
  pluginPaths = lib.mapAttrsToList (name: type: pluginsDir + "/${name}") pluginFiles;

  # Import plugin configs
  importedPlugins = map (path: import path { inherit pkgs lib; }) pluginPaths;

  # Flatten plugins and concatenate lua
  allPlugins = lib.flatten (map (cfg: cfg.plugins or [ ]) importedPlugins);
  pluginsLua = lib.concatStringsSep "\n" (map (cfg: cfg.lua or "") importedPlugins);

  fullLua = lib.concatStringsSep "\n" [
    "vim.env.MYVIMRC = \"${toString ./.}\""
    options
    autocmds
    pluginsLua
  ];
in
pkgs.neovim.override {
  configure = {
    customRC = ''
lua << EOF
${fullLua}
EOF
    '';
    packages.myPlugins.start = allPlugins;
  };
}
