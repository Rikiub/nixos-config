{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    import-tree.url = "github:denful/import-tree";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      import-tree,
      ...
    }:
    let
      mkHost =
        hostname:

        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs hostname; };
          modules = [
            (import-tree ./modules/system)
            (import-tree ./hosts/${hostname}/system)
            ./hosts/${hostname}/hardware-configuration.nix

            home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      nixosConfigurations = {
        laptop = mkHost "laptop";
      };
    };
}
