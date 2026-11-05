{
  flake.aspects = { aspects, ... }: {
    anv16 = {
      includes = with aspects; [
        defaults # Core
        nixos # System

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
