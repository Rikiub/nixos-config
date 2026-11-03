{
  flake.aspects.xdg = {
    nixos = { ... }: {
      nix.settings.use-xdg-base-directories = true;
    };

    homeManager = { config, ... }: {
      home.preferXdgDirectories = true;
      xdg.mimeApps.enable = true; # Allow aspects set default apps

      home.sessionVariables = {
        _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";

        GOPATH = "${config.xdg.dataHome}/go";
        CARGO_HOME = "${config.xdg.dataHome}/cargo";
        RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
        GNUPGHOME = "${config.xdg.dataHome}/gnupg";

        npm_config_cache = "${config.xdg.cacheHome}/npm";
        HISTFILE = "${config.xdg.cacheHome}/bash/history";
        PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/cpython";
      };
    };
  };
}
