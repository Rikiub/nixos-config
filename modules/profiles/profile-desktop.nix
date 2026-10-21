{
  flake.aspects = { aspects, ... }: {
    profile-desktop = {
      includes = with aspects; [
        niri-session
        noctalia-greeter
        keyring
        xdg

        apps-common
        apps-desktop
        apps-gaming
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
