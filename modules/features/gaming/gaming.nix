{
  flake.aspects = { aspects, ... }: {
    apps-gaming = {
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
