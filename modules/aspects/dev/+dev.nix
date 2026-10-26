{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
        git
        jujutsu
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
