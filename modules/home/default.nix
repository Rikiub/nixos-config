{
  imports = [
    ./nushell
    ./niri

    ./xdg.nix
    ./syncthing.nix
    ./theme.nix

    ./common.nix
    ./cli.nix
    ./dev.nix
    ./gaming.nix
  ];

  home.stateVersion = "26.05";
}
