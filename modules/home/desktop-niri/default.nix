{ pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  home.packages = with pkgs; [
    niri
  ];

  # Symlink config
  xdg.configFile."niri/config.d".source = ./niri/config.d;
  xdg.configFile."niri/modules".source = ./niri/modules;
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;

  # Desktop Shell
  programs.noctalia.enable = true;
}
