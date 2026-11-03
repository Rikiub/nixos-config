{
  flake.aspects.obsidian.homeManager = { ... }: {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
    };

    xdg.mimeApps.defaultApplications = {
      "text/markdown" = "md.obsidian.Obsidian.desktop";
    };
  };
}
