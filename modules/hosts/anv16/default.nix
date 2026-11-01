{ config, inputs, ... }:
let
  hostname = "anv16";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };

    modules = [
      ./../../options.nix

      # set system hostname
      { networking.hostName = hostname; }

      # host nixos
      config.flake.modules.nixos.${hostname}

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.${config.flake.user.name}.imports = [
            # host home-manager
            config.flake.modules.homeManager.${hostname}
          ];
        };
      }
    ];
  };
}
