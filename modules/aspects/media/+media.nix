{
  flake.aspects = { aspects, ... }: {
    media = {
      includes = with aspects; [
        xdg

        # Apps
        obsidian
        ghostty
        firefox
        discord
        zed-editor
        kde-apps
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
