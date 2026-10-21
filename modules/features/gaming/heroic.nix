{
  flake.aspects.heroic = {
    nixos = { ... }: {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        heroic
      ];
    };
  };
}
