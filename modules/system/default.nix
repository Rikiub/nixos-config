{ hostname, ... }:

{
  imports = [
    ./options.nix
    ./boot.nix
    ./sound.nix
    ./locale.nix
    ./programs.nix
    ./desktop.nix
    ./filesystems.nix
    ./nix.nix
    ./network.nix
    ./users.nix
    ./services.nix
    ./hardware.nix
    ./gaming.nix
    ./home-manager.nix
  ];

  system.stateVersion = "26.05";
  system.nixos.label = "NixOS";
  networking.hostName = hostname;
}
