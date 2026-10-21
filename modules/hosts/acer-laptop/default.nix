{ config, inputs, ... }:

let
  features = [
    "host-acer-laptop"

    "profile-linux"
    "profile-shell"
    "profile-dev"
    "profile-desktop"
    "gaming"
  ];

  # Aliases
  hardware = inputs.nixos-hardware.nixosModules;
  inherit (config.flake.modules) nixos homeManager;

  # Pick only the variants that actually exist in that module class.
  pickNixos = builtins.filter (f: nixos ? ${f}) features;
  pickHomeManager = builtins.filter (f: homeManager ? ${f}) features;
in
{
  flake.nixosConfigurations.acer-laptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      # Hardware specific
      hardware.common-pc-laptop
      hardware.common-pc-ssd
      hardware.common-cpu-intel
      hardware.common-gpu-nvidia
    ]
    # NixOS side of each feature
    ++ (map (f: nixos.${f}) pickNixos)
    ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.rikiub.imports = (map (f: homeManager.${f}) pickHomeManager);
        };
      }
    ];
  };
}
