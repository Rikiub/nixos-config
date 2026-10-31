{
  flake.aspects.python.homeManager = { config, pkgs, ... }: {
    home.packages = with pkgs; [ python3 ]; # Python system-wide
    programs.uv.enable = true; # Python Toolchain

    home.sessionVariables = {
      PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/cpython";
    };
  };
}
