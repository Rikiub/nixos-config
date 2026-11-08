{
  flake.aspects.direnv.homeManager = { ... }: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableGitIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
