{
  flake.aspects = { aspects, ... }: {
    dolphin = {
      nixos = { ... }: {
        services.udisks2.enable = true; # For show drives
      };

      homeManager = { pkgs, ... }: {
        home.packages = with pkgs; [
          kdePackages.dolphin # File Manager
          kdePackages.ark # Zip Manager
          gdk-pixbuf # Image Thumbnails
          ffmpegthumbnailer # Video Thumbnails
          kdePackages.kdegraphics-thumbnailers # PDF Thumbnails
        ];

        # Set Dolphin as default
        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "inode/directory" = "org.kde.dolphin.desktop";
          };
        };

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
          config.common."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
        };
      };
    };

    kde-apps = {
      includes = with aspects; [ dolphin ];

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
        ];

        # Set default apps
        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "video/*" = "org.kde.haruna.desktop";
            "audio/*" = "org.kde.elisa.desktop";
            "image/*" = "org.kde.koko.desktop";
            "application/pdf" = "org.kde.okular.desktop";
          };
        };
      };
    };
  };
}
