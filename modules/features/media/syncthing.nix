{
  flake.aspects.syncthing.homeManager =
    let
      phoneDevice = "Android";
    in
    {
      config,
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [ syncthingtray ];

      services.syncthing = {
        enable = true;

        settings = {
          devices = {
            ${phoneDevice} = {
              id = "F7E4ZZI-OIBBWZ6-KHSYACL-SRO66AJ-AWRMLNI-E3BDF3Q-BKTAMPG-U25LGAT";
            };
          };
          folders = {
            "Publico" = {
              id = "publico";
              path = "${config.xdg.userDirs.publicShare}";
              devices = [ phoneDevice ];
              ignorePerms = true;
            };
            "Obsidian" = {
              id = "obsidian";
              path = "${config.xdg.userDirs.documents}/Obsidian";
              devices = [ phoneDevice ];
              ignorePerms = true;
            };
            "Musica" = {
              id = "musica";
              path = "${config.xdg.userDirs.music}/Personal";
              devices = [ phoneDevice ];
              ignorePerms = true;
            };
            "Imagenes" = {
              id = "imagenes";
              path = "${config.xdg.userDirs.pictures}/Personal";
              devices = [ phoneDevice ];
              ignorePerms = true;
            };
            "Videos" = {
              id = "videos";
              path = "${config.xdg.userDirs.videos}/Personal";
              devices = [ phoneDevice ];
              ignorePerms = true;
            };
          };
        };
      };
    };
}
