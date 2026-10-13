{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # My common apps
    discord
    obsidian
    kdePackages.elisa
  ];
}
