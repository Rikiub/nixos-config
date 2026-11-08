{
  flake.aspects.easyeffects = {
    nixos = { ... }: {
      programs.dconf.enable = true;
    };

    homeManager = { ... }: {
      services.easyeffects.enable = true;
    };
  };
}
