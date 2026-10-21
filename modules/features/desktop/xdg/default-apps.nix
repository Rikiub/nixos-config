{
  flake.aspects.xdg.homeManager = { ... }: {
    xdg = {
      mimeApps = {
        enable = true;
        defaultApplications = {
          "image/*" = "org.kde.koko.desktop";
          "video/*" = "org.kde.haruna.desktop";
          "audio/*" = "org.kde.elisa.desktop";
          "application/pdf" = "okular.desktop";
        };
      };
      terminal-exec = {
        enable = true;
        settings = {
          default = [ "ghostty.desktop" ];
        };
      };
    };
  };
}
