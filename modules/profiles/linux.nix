{ config, ... }:
{
  flake.modules.nixos.profile-linux = { ... }: {
    imports = with config.flake.modules.nixos; [
      # Boot
      kernel
      loader
      plymouth

      # Hardware
      bluetooth
      network
      sound

      # Core
      filesystem
      locale
      nix
      options
      users

      # Helpers
      just-cfg

      # Programs
      # flatpak
      nix-ld
      ssh
      sudo
    ];
  };

  flake.modules.homeManager.profile-linux = { ... }: {
    imports = with config.flake.modules.homeManager; [
      home-manager
      syncthing
    ];
  };
}
