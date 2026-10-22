{
  flake.aspects = { aspects, ... }: {
    base = {
      includes = with aspects; [
        nix
        options
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
