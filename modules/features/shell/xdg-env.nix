{
  flake.modules.homeManager.shell = { config, ... }: {
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
}
