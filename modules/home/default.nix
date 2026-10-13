{
  imports = [
    ./nushell
    ./desktop-niri

    ./xdg.nix
    ./syncthing.nix

    ./common.nix
    ./cli.nix
    ./dev.nix
    ./gaming.nix
  ];

  home.stateVersion = "26.05";
}
