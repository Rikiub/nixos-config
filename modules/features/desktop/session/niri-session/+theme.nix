{
  flake.aspects.niri-session.homeManager = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;

      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 32;

      gtk.enable = true;
      x11.enable = false;
    };

    gtk = {
      enable = true;

      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };

      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };
    };

    qt = {
      enable = true;
      style = {
        name = "breeze";
        package = pkgs.kdePackages.breeze;
      };
      platformTheme = {
        name = "kde";
        # package = pkgs.qtengine;
      };
    };
  };
}
