{ pkgs, ... }:

{
  home.packages = [
    pkgs.niri
    pkgs.ghostty
  ];
  xdg.configFile."niri".source = ./.;

  programs.noctalia.enable = true;
}
