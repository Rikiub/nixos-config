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
      # Memoized directory scans
      systemModules = import-tree ./modules/system;
      homeModules = import-tree ./modules/home;

      # Per host function
      mkHost =
        hostname:
        {
          system ? "x86_64-linux",
          ...
        }:

        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs; };

          modules = [
            ({ ... }: {
              config.host.name = hostname;
            })

            # System
            systemModules
            (import-tree ./hosts/${hostname}/system)

            # Home Manager
            home-manager.nixosModules.home-manager
            ({ config, ... }: {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };

                users.${config.user.name} = {
                  imports = [
                    homeModules
                    (import-tree ./hosts/${hostname}/home)
                  ];
                };
              };
            })
          ];
        };

      # Collect all hosts
      hostnames = builtins.attrNames (
        nixpkgs.lib.filterAttrs (name: type: type == "directory") (builtins.readDir ./hosts)
      );
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostnames (host: mkHost host { });
    };
}
