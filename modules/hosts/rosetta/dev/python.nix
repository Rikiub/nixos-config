{
  flake.aspects.rosetta.homeManager = { ... }: {
    programs.uv.settings = {
      cache-dir = "/media/Datos/.uv-cache";
    };
  };
}
