{
  flake.aspects = { aspects, ... }: {
    gaming = {
      includes = with aspects; [
        gaming-extras

        heroic
        steam
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
