{
  flake.modules.homeManager.editors = { ... }: {
    programs = {
      fresh-editor.enable = true;
      zed-editor.enable = true;
    };
  };
}
