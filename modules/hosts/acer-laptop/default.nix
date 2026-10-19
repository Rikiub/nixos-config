{ config, inputs, ... }:

let
  hardware = inputs.nixos-hardware.nixosModules;
  inherit (config.flake.modules) nixos homeManager;
in
{
  # Define the NixOS system for "jupiter"
  flake.nixosConfigurations.acer-laptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with nixos; [
      # Hardware specific
      hardware.common-pc-laptop
      hardware.common-pc-ssd
      hardware.common-cpu-intel
      hardware.common-gpu-nvidia
      host-acer-laptop

      # Modules
      boot
      shell
      desktop
      hardware
      gaming
      programs
      filesystem
      locale
      nix
      options
      users

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.rikiub = {
            imports = with homeManager; [
              host-acer-laptop
              home-manager
              programs
              dev
              shell
              gaming
              desktop
              programs
              xdg
            ];
          };
        };
      }
    ];
  };
}
