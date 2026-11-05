{
  flake.aspects.anv16.homeManager = { pkgs, config, ... }: {
    home.packages = with pkgs; [ restic ];

    services.restic = {
      enable = true;

      backups.obsidian = {
        repository = "/media/Datos/Raiz/Respaldos/Restic/Obsidian";
        passwordFile = "${config.xdg.configHome}/restic/obsidian";

        paths = [ "${config.xdg.userDirs.documents}/Obsidian" ];
        initialize = true;

        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 4"
          "--keep-monthly 6"
        ];

        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
          RandomizedDelaySec = "30m";
        };
      };
    };
  };
}
