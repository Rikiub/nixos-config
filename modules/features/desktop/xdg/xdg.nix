{
  flake.aspects.xdg.homeManager = { ... }: {
    xdg = {
      enable = true;
      autostart.enable = true;
    };
  };
}
