{
  flake.aspects.obsidian.homeManager = { ... }: {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
    };
  };
}
