{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Required
    niri
    ghostty

    # Goodies
    loupe
    nautilus
  ];

  # Symlink config
  xdg.configFile."niri/config.d".source = ./config.d;
  xdg.configFile."niri/modules".source = ./modules;
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # Desktop Shell
  programs.noctalia.enable = true;

  # Theming

  qt = {
    enable = true;
    platformTheme = {
      name = "kde";
      # package = pkgs.qt6Packages.qt6ct;
    };
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
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

    cursorTheme = {
      name = "Capitaine Cursors";
      package = pkgs.capitaine-cursors;
    };
  };
}
