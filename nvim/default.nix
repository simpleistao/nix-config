{ pkgs, lib, ... }:
{
  imports = [
    ./options.nix
  ] ++ (
    let
      pluginsDir = ./plugins;
      files = builtins.readDir pluginsDir;
      nixFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) files;
    in
    lib.mapAttrsToList (name: type: pluginsDir + "/${name}") nixFiles
  );

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
