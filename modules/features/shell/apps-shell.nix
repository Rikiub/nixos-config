{
  flake.aspects.apps-shell.homeManager = { pkgs, ... }: {
    # DEFAULTS
    home.sessionVariables = {
      EDITOR = "fresh";
      PAGER = "bat --paging=always";
      MANPAGER = "bat -l man -p";
    };

    # PROGRAMS
    home.packages = with pkgs; [
      tre-command # Tree
      ouch # Zip Manager
      trash-cli # Trash Manager
    ];

    programs = {
      # System Stats
      fastfetch.enable = true;
      btop.enable = true;

      # Explorers
      bat.enable = true;
      ripgrep.enable = true;

      # Editor
      fresh-editor.enable = true;

      # File Manager
      yazi = {
        enable = true;
        enableNushellIntegration = true;
      };

      # TLDR for CLI apps
      tealdeer = {
        enable = true;
        enableAutoUpdates = true;
      };
    };
  };
}
