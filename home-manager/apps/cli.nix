{ pkgs, ... }:

{
  programs.nushell.enable = true;
  home.packages = [
    pkgs.bat
    pkgs.yazi
    pkgs.fastfetch
    pkgs.tealdeer
    pkgs.btop
    pkgs.tree
    pkgs.ripgrep
  ];
}
