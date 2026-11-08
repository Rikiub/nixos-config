{
  flake.aspects.ghostty.homeManager = { ... }: {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Catppuccin Mocha";
        confirm-close-surface = false;
      };
    };

    xdg.terminal-exec = {
      enable = true;
      settings.default = [ "ghostty.desktop" ];
    };
  };
}
