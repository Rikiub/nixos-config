{ inputs, config, ... }:
let
  hosts = {
    anv16.system = "x86_64-linux";
  };

  mkHost =
    name:
    { system }:
    let
      host = { inherit name system; };
      inherit (config.flake) user;
    in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs host user; };

      modules = [
        config.flake.modules.nixos.defaults
        config.flake.modules.nixos.${name}
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs host user; };
            users.${user.name}.imports = [
              config.flake.modules.homeManager.defaults
              config.flake.modules.homeManager.${name}
            ];
          };
        }
      ];
    };
in
{
  flake.nixosConfigurations = builtins.mapAttrs (name: cfg: mkHost name cfg) hosts;
}
