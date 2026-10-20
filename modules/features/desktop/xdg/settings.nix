{
  flake.modules.homeManager.xdg = { ... }: {
    xdg = {
      enable = true;
      autostart.enable = true;
    };
  };
}
