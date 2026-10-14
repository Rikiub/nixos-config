{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gdk-pixbuf # Image Thumbnails
    ffmpeg-headless # Video Thumbnails
    ffmpegthumbnailer # Video Thumbnails

    haruna # Video Player
    kdePackages.elisa # Music Player
    kdePackages.koko # Image Viewer
    kdePackages.okular # PDF Viewer
    kdePackages.dolphin # File Manager
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
