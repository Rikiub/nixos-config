{
  flake.aspects.anv16.homeManager = { ... }: {
    programs.uv.settings = {
      cache-dir = "/media/Datos/.uv-cache";
    };
  };
}
