{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Goodies
    loupe
    papers
    kdePackages.dolphin
    kdePackages.elisa
  ];

  programs = {
    firefox.enable = true;
    discord.enable = true;
    obsidian = {
      enable = true;
      cli.enable = true;
    };

    ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
      };
    };
  };
}
