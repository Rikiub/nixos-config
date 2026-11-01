{
  flake.aspects.anv16.homeManager =
    {
      config,
      pkgs,
      ...
    }:
    let
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
              path = "${config.xdg.userDirs.documents}/Obsidian";
              inherit devices ignorePerms;
            };
            "Musica" = {
              id = "musica";
              path = "${config.xdg.userDirs.music}/Personal";
              inherit devices ignorePerms;
            };
            "Imagenes" = {
              id = "imagenes";
              path = "${config.xdg.userDirs.pictures}/Personal";
              inherit devices ignorePerms;
            };
            "Videos" = {
              id = "videos";
              path = "${config.xdg.userDirs.videos}/Personal";
              inherit devices ignorePerms;
            };
          };
        };
      };
    };
}
