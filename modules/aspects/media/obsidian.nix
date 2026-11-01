{
  flake.aspects.obsidian.homeManager = { ... }: {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/markdown" = "md.obsidian.Obsidian.desktop";
      };
    };
  };
}
