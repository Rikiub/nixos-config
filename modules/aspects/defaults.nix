{
  flake.aspects = { aspects, ... }: {
    defaults = {
      includes = with aspects; [ xdg ];

      nixos = { ... }: {
        system.stateVersion = "26.11";
      };

      homeManager = { pkgs, ... }: {
        home.stateVersion = "26.11";

        # Avoid errors for existing dotfiles
        home.backupCommand = "${pkgs.trash-cli}/bin/trash";
      };
    };
  };
}
