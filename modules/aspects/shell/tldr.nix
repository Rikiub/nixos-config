{
  flake.aspects.tldr.homeManager = { ... }: {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };
  };
}
