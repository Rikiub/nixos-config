{
  flake.aspects = { aspects, ... }: {
    media = {
      includes = with aspects; [
        obsidian
        ghostty
        syncthing
        firefox
        discord
      ];

      homeManager = { };
    };
  };
}
