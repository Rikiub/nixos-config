{ config, ... }:

let
  inherit (config) xdg;
in
{
  xdg.enable = true;

  home.sessionVariables = {
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${xdg.configHome}/java";

    GOPATH = "${xdg.dataHome}/go";
    CARGO_HOME = "${xdg.dataHome}/cargo";
    RUSTUP_HOME = "${xdg.dataHome}/rustup";
    GNUPGHOME = "${xdg.dataHome}/gnupg";

    npm_config_cache = "${xdg.cacheHome}/npm";
    HISTFILE = "${xdg.cacheHome}/bash/history";
    PYTHONPYCACHEPREFIX = "${xdg.cacheHome}/cpython";
  };
}
