{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Required
    niri
    ghostty

    # Extras
    kdePackages.dolphin
  ];
  xdg.configFile."niri".source = ./.;

  # Shell
  programs.noctalia.enable = true;

  # Add QT styling
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
}
