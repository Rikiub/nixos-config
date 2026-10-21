{
  flake.aspects = { aspects, ... }: {
    profile-shell = {
      includes = with aspects; [
        apps-shell
        xdg-redirect

        nushell # Default Interactive Shell
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
