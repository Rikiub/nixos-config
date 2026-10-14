{ pkgs, ... }:

{
  home.packages = with pkgs; [
    niri
  ];

  # Symlink config
  xdg.configFile."niri/config.d".source = ./config.d;
  xdg.configFile."niri/modules".source = ./modules;
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # Desktop Shell
  programs.noctalia.enable = true;
}
