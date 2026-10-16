{ pkgs, ... }:

{
  imports = [
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    niri
    cliphist # Clipboard Manager
    xwayland-satellite # x11 support
  ];

  # Symlink config
  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
    "niri/config.d".source = ./config.d;
    "niri/modules".source = ./modules;
  };
}
