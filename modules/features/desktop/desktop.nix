{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        niri-session
        noctalia-greeter
        keyring
        xdg
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
