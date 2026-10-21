{
  flake.aspects.zed-editor.homeManager = { ... }: {
    programs = {
      zed-editor.enable = true;
    };
  };
}
