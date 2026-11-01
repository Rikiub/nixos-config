{
  flake.aspects.kde-apps = {
    nixos = { ... }: {
      programs.partition-manager.enable = true; # KDE Partition Manager
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        haruna # Video Player
        kdePackages.elisa # Music Player
        kdePackages.koko # Image Viewer
        kdePackages.okular # PDF Viewer
        kdePackages.kalk # Calculator

        kdePackages.dolphin # File Manager
        kdePackages.ark # Zip Manager
        gdk-pixbuf # Image Thumbnails
        ffmpegthumbnailer # Video Thumbnails
        kdePackages.kdegraphics-thumbnailers # PDF Thumbnails
      ];

      # Set default apps
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "video/*" = "org.kde.haruna.desktop";
          "audio/*" = "org.kde.elisa.desktop";
          "image/*" = "org.kde.koko.desktop";
          "application/pdf" = "okular.desktop";
          "inode/directory" = "dolphin.desktop";
        };
      };

      # Set Dolphin as file chooser
      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
        config.common."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
      };
    };
  };
}
