{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        gnome-keyring
        niri-session
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
