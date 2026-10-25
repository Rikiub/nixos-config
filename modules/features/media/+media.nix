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
        kde-apps

        # Services
        llm
        syncthing
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
