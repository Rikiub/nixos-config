{
  flake.aspects.anv16.homeManager =
    {
      config,
      pkgs,
      ...
    }:
    let
      rootDir = "/media/Datos/Raiz/Usuario";

      dev = {
        phone = "Android";
      };
      devices = [
        dev.phone
      ];
      ignorePerms = true;
    in
    {
      home.packages = with pkgs; [ syncthingtray ];

      services.syncthing = {
        enable = true;

        settings = {
          devices = {
            ${dev.phone} = {
              id = "F7E4ZZI-OIBBWZ6-KHSYACL-SRO66AJ-AWRMLNI-E3BDF3Q-BKTAMPG-U25LGAT";
            };
          };
          folders = {
            "Publico" = {
              id = "publico";
              path = "${config.xdg.userDirs.publicShare}";
              inherit devices ignorePerms;
            };
            "Obsidian" = {
              id = "obsidian";
              path = "${rootDir}/Documentos/Obsidian";
              inherit devices ignorePerms;
            };
            "Musica" = {
              id = "musica";
              path = "${rootDir}/Musica/Personal";
              inherit devices ignorePerms;
            };
            "Imagenes" = {
              id = "imagenes";
              path = "${rootDir}/Imagenes/Personal";
              inherit devices ignorePerms;
            };
            "Videos" = {
              id = "videos";
              path = "${rootDir}/Videos/Personal";
              inherit devices ignorePerms;
            };
          };
        };
      };
    };
}
