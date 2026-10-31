{
  flake.aspects.apps-shell.homeManager = { pkgs, ... }: {
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
      ripgrep.enable = true;
    };
  };
}
