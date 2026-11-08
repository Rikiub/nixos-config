{
  flake.aspects.apps-shell.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      trash-cli # Trash Manager
      tre-command # Tree
      ouch # Zip Manager
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
