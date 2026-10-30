{
  flake.aspects = { aspects, ... }: {
    acer-laptop = {
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
