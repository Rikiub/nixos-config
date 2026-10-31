{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
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
