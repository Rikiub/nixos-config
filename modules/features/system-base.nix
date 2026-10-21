{
  flake.aspects = { aspects, ... }: {
    system-base = {
      includes = with aspects; [
        nix
        options
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
