{ hostname, ... }:

{
  imports = [
    ./boot
    ./desktop
    ./hardware
    ./programs

    ./options.nix
    ./locale.nix
    ./filesystems.nix
    ./nix.nix
    ./users.nix
    ./scripts.nix
    ./home-manager.nix
  ];

  system.stateVersion = "26.05";
  system.nixos.label = "NixOS";
  networking.hostName = hostname;
}
