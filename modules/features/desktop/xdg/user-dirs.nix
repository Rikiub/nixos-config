{
  flake.aspects.xdg.homeManager =
    { config, lib, ... }:
    let
      root = "/media/Datos/Personal";
      home = config.home.homeDirectory;
      names = {
        documents = "Documentos";
        downloads = "Descargas";
        music = "Musica";
        pictures = "Imagenes";
        videos = "Videos";
        public = "Publico";
        projects = "Proyectos";
      };
      symlink = target: config.lib.file.mkOutOfStoreSymlink "${root}/${target}";
    in
    {
      xdg.userDirs = {
        enable = true;
        createDirectories = false;
        setSessionVariables = true;

        documents = "${home}/${names.documents}";
        download = "${home}/${names.downloads}";
        music = "${home}/${names.music}";
        pictures = "${home}/${names.pictures}";
        videos = "${home}/${names.videos}";
        publicShare = "${home}/${names.public}";
      };

      home.file = lib.mapAttrs' (_name: value: lib.nameValuePair value { source = symlink value; }) names;
    };
}
