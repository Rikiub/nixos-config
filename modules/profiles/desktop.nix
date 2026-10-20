{ config, ... }:
{
  flake.modules.nixos.profile-desktop = { ... }: {
    imports = with config.flake.modules.nixos; [
      desktop-compat
      display-manager
      keyring

      niri
    ];
  };

  flake.modules.homeManager.profile-desktop = { ... }: {
    imports = with config.flake.modules.homeManager; [
      desktop-apps
      desktop-theme
      xdg
      syncthing

      niri
    ];
  };
}
