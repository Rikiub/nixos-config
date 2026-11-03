{ config, inputs, ... }:
let
  system = "x86_64-linux";
  host.name = "anv16";
  inherit (config.flake) user;
in
{
  flake.nixosConfigurations.${host.name} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs;
      inherit host user;
    };

    modules = [
      ./../../options.nix

      # set system hostname
      { networking.hostName = host.name; }

      # host nixos
      config.flake.modules.nixos.${host.name}

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit host user;
          };
          users.${user.name}.imports = [
            # host home-manager
            config.flake.modules.homeManager.${host.name}
          ];
        };
      }
    ];
  };
}
