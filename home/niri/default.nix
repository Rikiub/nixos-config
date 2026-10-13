{ pkgs, ... }:

{
  home.packages = [
    pkgs.niri
    pkgs.ghostty
    pkgs.wl-clipboard
  ];
  xdg.configFile."niri".source = ./.;

  programs.noctalia.enable = true;
}
