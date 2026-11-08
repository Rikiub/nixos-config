{
  flake.aspects = { aspects, ... }: {
    media = {
      includes = with aspects; [
        kde-apps
        obsidian
        ghostty
        firefox
        discord
        zed-editor
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
