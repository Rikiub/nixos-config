{
  flake.aspects = { aspects, ... }: {
    profile-base = {
      includes = with aspects; [
        nix
        options
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
