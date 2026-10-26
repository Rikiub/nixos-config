{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
        git
        jj
        just
        nix
        nodejs
        python
        zed-editor
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
