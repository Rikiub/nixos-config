{
  flake.aspects.pnpm.homeManager = { ... }: {
    programs.pnpm.enable = true; # NodeJS Package Manager
  };
}
