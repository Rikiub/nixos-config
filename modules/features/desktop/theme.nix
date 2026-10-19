{ ... }:

{
  flake.modules.homeManager.desktop = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;

      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 32;

      x11.enable = true;
      gtk.enable = true;
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
