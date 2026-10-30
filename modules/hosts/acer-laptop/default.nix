{ config, inputs, ... }:

let
  hostname = "acer-laptop";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    system = system;
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
