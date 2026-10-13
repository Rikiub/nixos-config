{ config, osConfig, ... }:

let
  root = osConfig.externalHome;
  names = {
    documents = "Documentos";
    downloads = "Descargas";
    music = "Musica";
    pictures = "Imagenes";
    videos = "Videos";
    public = "Publico";
    projects = "Proyectos";
  };
in
{
  xdg = {
    enable = true;
    autostart.enable = true;

    terminal-exec = {
      enable = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "papers.desktop";
        "image/*" = "loupe.desktop";
      };
    };

    userDirs = {
      enable = true;
      createDirectories = false;
      setSessionVariables = true;

      documents = "${config.home.homeDirectory}/${names.documents}";
      download = "${config.home.homeDirectory}/${names.downloads}";
      music = "${config.home.homeDirectory}/${names.music}";
      pictures = "${config.home.homeDirectory}/${names.pictures}";
      videos = "${config.home.homeDirectory}/${names.videos}";
      publicShare = "${config.home.homeDirectory}/${names.public}";
    };
  };

  home.file."${names.documents}".source =
    config.lib.file.mkOutOfStoreSymlink "${root}/${names.documents}";
  home.file."${names.downloads}".source =
    config.lib.file.mkOutOfStoreSymlink "${root}/${names.downloads}";
  home.file."${names.music}".source = config.lib.file.mkOutOfStoreSymlink "${root}/${names.music}";
  home.file."${names.pictures}".source =
    config.lib.file.mkOutOfStoreSymlink "${root}/${names.pictures}";
  home.file."${names.videos}".source = config.lib.file.mkOutOfStoreSymlink "${root}/${names.videos}";
  home.file."${names.public}".source = config.lib.file.mkOutOfStoreSymlink "${root}/${names.public}";
  home.file."${names.projects}".source =
    config.lib.file.mkOutOfStoreSymlink "${root}/${names.projects}";
}
