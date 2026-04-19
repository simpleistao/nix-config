{ pkgs, lib, ... }:
{
  imports = [
    ./options.nix
    ./autocmds.nix
  ] ++ (
    let
      pluginsDir = ./plugins;
      files = builtins.readDir pluginsDir;
      nixFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) files;
    in
    lib.mapAttrsToList (name: type: pluginsDir + "/${name}") nixFiles
  );
}
