{
  flake.aspects.apps-shell.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      wl-clipboard # Clipboard on Wayland
      tre-command # Tree
      ouch # Zip Manager
      trash-cli # Trash Manager
    ];

    programs = {
      # System Stats
      fastfetch.enable = true;
      btop.enable = true;

      # Explorers
      ripgrep.enable = true;
    };
  };
}
