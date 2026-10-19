{
  flake.modules.homeManager.shell = { pkgs, ... }: {
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
