{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        niri-session
        gnome-keyring
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
