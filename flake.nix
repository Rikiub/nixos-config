{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHost =
        hostname:

        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs hostname; };
          modules = [
            ./modules/system
            ./hosts/${hostname}/system
            ./hosts/${hostname}/hardware-configuration.nix

            home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      nixosConfigurations = {
        nixos = mkHost "nixos";
      };
    };
}
