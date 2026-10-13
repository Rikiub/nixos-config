{
  imports = [
    ./boot.nix
    ./sound.nix
    ./locale.nix
    ./programs.nix
    ./desktop.nix
    ./filesystems.nix
    ./nix.nix
    ./network.nix
    ./users.nix
  ];

  system.stateVersion = "26.05";
  system.nixos.label = "NixOS";
}
