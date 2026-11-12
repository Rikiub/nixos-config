{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        niri-desktop
        gnome-keyring
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
