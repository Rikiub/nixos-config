{
  flake.aspects = { aspects, ... }: {
    shell = {
      includes = with aspects; [
        apps-shell
        bat
        fresh-editor
        tldr
        yazi
        nushell # Interactive Shell
        xdg-redirect # Extras
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
