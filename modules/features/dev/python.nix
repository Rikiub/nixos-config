{
  flake.aspects.python.homeManager = { config, ... }: {
    programs.uv.enable = true; # Python Manager

    home.sessionVariables = {
      PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/cpython";
    };
  };
}
