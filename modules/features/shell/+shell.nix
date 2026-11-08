{
  flake.aspects = { aspects, ... }: {
    shell = {
      includes = with aspects; [
        apps-shell
        bat
        clipboard-shell
        fresh-editor
        tldr
        yazi
        nushell # Interactive Shell
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
