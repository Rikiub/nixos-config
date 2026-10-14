{ pkgs, ... }:

{
  home.packages = with pkgs; [
    niri
    xwayland-satellite # x11 support
  ];

  # Symlink config
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/config.d".source = ./config.d;
  xdg.configFile."niri/modules".source = ./modules;

  # Desktop Shell
  programs.noctalia.enable = true;
}
