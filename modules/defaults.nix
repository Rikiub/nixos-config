{
  flake.aspects = { aspects, ... }: {
    defaults = {
      includes = with aspects; [
        nix
        options
      ];

      homeManager = { ... }: {
        home.stateVersion = "26.05";
      };

      nixos = { ... }: {
        system.stateVersion = "26.05";
      };
    };
  };
}
