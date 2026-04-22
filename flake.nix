{
  description = "Home Manager configuration of tomzhi";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      homeConfigurations."tomzhi" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          unstablePkgs = nixpkgs-unstable.legacyPackages.${system};
        };

        modules = [
          ./home.nix
          {
            nixpkgs.config.allowUnfree = true;
          }
        ];
      };
    };
}
