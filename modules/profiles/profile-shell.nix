{
  flake.aspects = { aspects, ... }: {
    profile-shell = {
      includes = with aspects; [
        shell
        nushell
      ];

      nixos = { };
    };
  };
}
