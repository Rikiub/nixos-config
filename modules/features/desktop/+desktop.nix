{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = with aspects; [
        noctalia-greeter
        niri-session
        oo7
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
