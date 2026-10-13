{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tree
    ouch
  ];

  programs = {
    fastfetch.enable = true;
    btop.enable = true;
    ripgrep.enable = true;
    bat.enable = true;

    yazi = {
      enable = true;
      enableNushellIntegration = true;
    };
    tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };
  };
}
