{
  flake.aspects.clean.nixos = { ... }: {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 30d --optimise";
      };
    };
  };
}
