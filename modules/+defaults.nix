{
  flake.aspects.defaults = {
    homeManager = { ... }: {
      home.stateVersion = "26.11";
    };

    nixos = { ... }: {
      system.stateVersion = "26.11";
    };
  };
}
