{
  flake.aspects = { aspects, ... }: {
    apps-common = {
      includes = with aspects; [
        obsidian
        ghostty
        syncthing
      ];

      homeManager = { ... }: {
        programs = {
          firefox.enable = true;
          discord.enable = true;
        };
      };
    };
  };
}
