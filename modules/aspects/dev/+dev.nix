{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
        direnv
        git
        just
        lsp
        nix
        nodejs
        python
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
