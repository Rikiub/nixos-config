{
  flake.aspects = { aspects, ... }: {
    profile-dev = {
      includes = with aspects; [
        dev
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
