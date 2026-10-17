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
          specialArgs = { inherit inputs; };
          modules = [
            (import-tree ./modules/system)
            (import-tree ./hosts/${hostname}/system)

            home-manager.nixosModules.home-manager
            ({ config, ... }: {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };

                users.${config.user.name} = {
                  imports = [
                    (import-tree ../home)
                    (import-tree ../../hosts/${hostname}/home)
                  ];
                };
              };
            })
          ];
        };
    in
    {
      nixosConfigurations = {
        laptop = mkHost "laptop";
      };
    };
}
