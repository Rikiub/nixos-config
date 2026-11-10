{
  flake.aspects = { aspects, ... }: {
    rosetta = {
      includes = with aspects; [
        # System
        nixos

        # Groups
        desktop
        shell
        dev
        media
        gaming
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
