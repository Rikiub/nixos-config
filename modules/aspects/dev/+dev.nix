{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
        direnv
        git
        just
        lsp
        nodejs
        python
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
