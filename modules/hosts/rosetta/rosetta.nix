{
  flake.aspects = { aspects, ... }: {
    rosetta = {
      includes = with aspects; [
        # System
        nixos

        # User
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
