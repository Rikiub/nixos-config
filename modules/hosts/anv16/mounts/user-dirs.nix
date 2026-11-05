{
  flake.aspects.anv16.homeManager =
    { config, lib, ... }:
    let
      # Config
      directory = {
        root = "/media/Datos/Raiz";
        user = "/media/Datos/Raiz/Usuario";
      };

      target = {
        root = [ "Respaldos" ];
        user = [ ];
        xdg = {
          documents = "Documentos";
          download = "Descargas";
          music = "Musica";
          pictures = "Imagenes";
          videos = "Videos";
          projects = "Proyectos";
          publicShare = "Publico";
        };
      };

      # Helper
      mkLinks =
        dir: names:
        lib.genAttrs names (name: {
          source = config.lib.file.mkOutOfStoreSymlink "${dir}/${name}";
        });
    in
    {
      xdg.userDirs = {
        enable = true;
        createDirectories = false;
        setSessionVariables = true;
        desktop = null;
      }
      // lib.mapAttrs (_: name: "${config.home.homeDirectory}/${name}") target.xdg;

      home.file =
        mkLinks directory.user (builtins.attrValues target.xdg)
        // mkLinks directory.user target.user
        // mkLinks directory.root target.root;
    };
}
