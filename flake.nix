{
  description = "Home Manager configuration of tomzhi";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Point to the local nvim flake
    nvim-flake.url = "path:./nvim";
  };

  outputs = { nixpkgs, home-manager, nixvim, nvim-flake, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # This makes 'nix run .' use the same package as the nvim subfolder
      packages.${system}.default = nvim-flake.packages.${system}.default;

      homeConfigurations."tomzhi" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
        ];
      };
    };
}
