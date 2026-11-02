{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        gnome-keyring
        noctalia-greeter
        niri-session
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
