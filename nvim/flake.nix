{
  description = "A standalone Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      
      # Build the standalone Neovim package
      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = import ./default.nix;
        extraSpecialArgs = { inherit inputs; };
      };
    in {
      packages.${system}.default = nvim;
      
      # Export the module so other flakes (like your home-manager) can use it
      nixosModules.default = import ./default.nix;
    };
}
