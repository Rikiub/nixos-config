{
  flake.aspects = { aspects, ... }: {
    anv16 = {
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
