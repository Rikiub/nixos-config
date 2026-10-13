{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Goodies
    loupe
    papers
    nautilus
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
