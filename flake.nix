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
    inputs@{ nixpkgs, home-manager, ... }:
    let
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs hostname; };
          modules = [
            # shared system config
            ./modules/system

            # host-specific (hardware + hostname)
            ./hosts/${hostname}/hardware-configuration.nix
            ./hosts/${hostname}/system

            # home-manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs hostname; };
              home-manager.users.rikiub = {
                imports = [
                  ./modules/home
                  ./hosts/${hostname}/home
                ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        nixos = mkHost "nixos";
      };
    };
}
