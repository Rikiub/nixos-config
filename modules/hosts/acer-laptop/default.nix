{ config, inputs, ... }:

let
  host = import ./_settings.nix;

  # Aliases
  inherit (config.flake.modules) nixos homeManager;

  # Pick only the variants that actually exist in that module class.
  pick = modules: builtins.filter (f: modules ? ${f}) host.aspects;
in
{
  flake.nixosConfigurations.${host.options.hostname} = inputs.nixpkgs.lib.nixosSystem {
    system = host.system;
    specialArgs = { inherit inputs; };

    modules = [
      { config.flake = host.options or { }; }
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
          users.${host.options.user.name}.imports = (map (f: homeManager.${f}) (pick homeManager));
        };
      }
    ];
  };
}
