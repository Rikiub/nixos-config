{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        niri-session
        noctalia-greeter
        gnome-keyring
        xdg
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
