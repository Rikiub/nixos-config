{
  flake.aspects = { aspects, ... }: {
    gaming = {
      includes = with aspects; [
        heroic
        mangohud
        steam
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
