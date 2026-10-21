{
  flake.aspects = { aspects, ... }: {
    shell = {
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
