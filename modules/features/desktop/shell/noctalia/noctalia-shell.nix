{
  flake.aspects.noctalia-shell = {
    nixos = { ... }: {
      programs = {
        noctalia = {
          enable = true;
          recommendedServices.enable = true;
        };
        gpu-screen-recorder.enable = true;
      };
    };

    homeManager = { ... }: {
      programs.noctalia = {
        enable = true;
        settings = ./noctalia.toml;
      };
    };
  };
}
