{
  flake.aspects.editors.homeManager = { ... }: {
    programs = {
      fresh-editor.enable = true;
      zed-editor.enable = true;
    };
  };
}
