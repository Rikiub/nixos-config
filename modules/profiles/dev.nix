{
  flake.aspects = { aspects, ... }: {
    profile-dev.includes = with aspects; [
      dev-nix
      dev-tools
      editors
      git
    ];
  };
}
