{
  flake.aspects = { aspects, ... }: {
    defaults = {
      includes = with aspects; [ xdg ];

      nixos = { ... }: {
        system.stateVersion = "26.11";
      };

      homeManager = { ... }: {
        home.stateVersion = "26.11";

        # Avoid errors for existing dotfiles
        home.backupFileExtension = "backup";
      };
    };

    xdg = {
      nixos = { ... }: {
        nix.settings.use-xdg-base-directories = true;
      };

      homeManager = { ... }: {
        home.preferXdgDirectories = true;
      };
    };
  };
}
