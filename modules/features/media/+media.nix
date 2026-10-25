{
  flake.aspects = { aspects, ... }: {
    media = {
      includes = with aspects; [
        xdg

        obsidian
        ghostty
        syncthing
        firefox
        discord
        kde-apps
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
