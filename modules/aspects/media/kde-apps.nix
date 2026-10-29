{
  flake.aspects.kde-apps = {
    nixos = { ... }: {
      programs.partition-manager.enable = true; # KDE Partition Manager
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        gdk-pixbuf # Image Thumbnails
        ffmpegthumbnailer # Video Thumbnails
        kdePackages.kdegraphics-thumbnailers # PDF Thumbnails

        haruna # Video Player
        kdePackages.elisa # Music Player
        kdePackages.koko # Image Viewer
        kdePackages.okular # PDF Viewer

        kdePackages.kalk # Calculator

        kdePackages.dolphin # File Manager
        kdePackages.ark # Zip Manager
      ];
    };
  };
}
