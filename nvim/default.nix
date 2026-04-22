{ pkgs, lib, ... }:
let
  # Basic files
  baseConfigs = [
    ./options.nix
    ./autocmds.nix
  ];

  # Plugins from the plugins directory
  pluginsDir = ./plugins;
  pluginFiles = builtins.attrNames (builtins.readDir pluginsDir);
  pluginPaths = map (name: pluginsDir + "/${name}") pluginFiles;

  allPaths = baseConfigs ++ pluginPaths;

  # Import everything
  importedConfigs = map (path: import path { inherit pkgs lib; }) allPaths;

  # Flatten all plugins and concatenate all lua strings
  allPlugins = lib.flatten (map (cfg: cfg.plugins or [ ]) importedConfigs);
  allLua = lib.concatStringsSep "\n" (map (cfg: cfg.lua or "") importedConfigs);
in
pkgs.neovim.override {
  configure = {
    customRC = allLua;
    packages.myVimPackage = {
      start = allPlugins;
    };
  };
}
