{
  flake.aspects = { aspects, ... }: {
    profile-desktop.includes = with aspects; [
      niri
      xdg
      display-manager
      gui-apps
      keyring

      syncthing
    ];
  };
}
