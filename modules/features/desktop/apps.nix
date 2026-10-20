{
  flake.modules.homeManager.desktop-apps = { pkgs, ... }: {
    home.packages = with pkgs; [
      gdk-pixbuf # Image Thumbnails
      ffmpeg-headless # Video Thumbnails
      ffmpegthumbnailer # Video Thumbnails

      haruna # Video Player
      kdePackages.elisa # Music Player
      kdePackages.koko # Image Viewer
      kdePackages.okular # PDF Viewer

      kdePackages.dolphin # File Manager
      kdePackages.ark # Zip Manager
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
          theme = "Catppuccin Mocha";
          confirm-close-surface = false;
        };
      };
    };
  };
}
