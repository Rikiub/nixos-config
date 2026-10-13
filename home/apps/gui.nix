{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # My common apps
    firefox
    discord
    obsidian
    kdePackages.elisa
  ];
}
