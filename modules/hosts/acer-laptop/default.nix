{ config, inputs, ... }:

let
  settings = import ./_settings.nix;

  # Aliases
  inherit (settings)
    system
    host
    user
    aspects
    ;
  inherit (config.flake.modules) nixos homeManager;

  # Pick only the variants that actually exist in that module class.
  pick = modules: builtins.filter (f: modules ? ${f}) aspects;
in
{
  flake.nixosConfigurations.${settings.host.name} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };

    modules = [
      (_: {
        config = {
          inherit host user;
        };
      })
    ]
    ++
      # NixOS side of each feature
      (map (f: nixos.${f}) (pick nixos))
    ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.${settings.user.name}.imports = (map (f: homeManager.${f}) (pick homeManager));
        };
      }
    ];
  };
}
