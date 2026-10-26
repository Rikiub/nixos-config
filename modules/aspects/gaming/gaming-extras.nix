{
  flake.aspects = { aspects, ... }: {
    gaming-extras = {
      includes = with aspects; [ mangohud ];

      nixos = { ... }: {
        programs = {
          gamemode.enable = true;
          gamescope.enable = true;
        };
      };
      homeManager = { ... }: { };
    };
  };
}
