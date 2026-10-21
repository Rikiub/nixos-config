{
  flake.aspects = { aspects, ... }: {
    dev = {
      includes = with aspects; [
        git
        just
        nix-tools
        pnpm
        uv
        zed-editor
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
