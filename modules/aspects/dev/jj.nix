{
  flake.aspects.jj.homeManager = { ... }: {
    programs.jujutsu = {
      enable = true;
    };
  };
}
