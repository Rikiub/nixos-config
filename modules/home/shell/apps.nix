{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tre # Better tree
    ouch # Zip manager
  ];

  programs = {
    # System Stats
    fastfetch.enable = true;
    btop.enable = true;

    # Misc
    ripgrep.enable = true;
    bat.enable = true;

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
}
