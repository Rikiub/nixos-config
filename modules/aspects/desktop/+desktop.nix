{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        keyring
        noctalia-greeter
        niri-session
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
