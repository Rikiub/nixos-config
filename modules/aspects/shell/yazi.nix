{
  flake.aspects.yazi.homeManager = { ... }: {
    programs.yazi = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
