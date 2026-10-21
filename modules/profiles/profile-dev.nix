{
  flake.aspects = { aspects, ... }: {
    profile-dev = {
      includes = with aspects; [
        dev-common
        dev-nix
        git
        zed-editor
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
