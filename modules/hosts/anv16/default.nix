{ config, inputs, ... }:
let
  host = {
    name = "anv16";
    system = "x86_64-linux";
  };
  inherit (config.flake) user;
in
{
  flake.nixosConfigurations.${host.name} = inputs.nixpkgs.lib.nixosSystem {
    inherit (host) system;
    specialArgs = { inherit inputs host user; };

    modules = [
      # host nixos
      config.flake.modules.nixos.${host.name}

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs host user; };
          users.${user.name}.imports = [
            # host home-manager
            config.flake.modules.homeManager.${host.name}
          ];
        };
      }
    ];
  };
}
