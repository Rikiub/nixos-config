{
  flake.aspects = { aspects, ... }: {
    profile-desktop = {
      includes = with aspects; [
        niri-session
        noctalia-greeter
        keyring
        xdg

        media
        gaming
        kde-apps
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
