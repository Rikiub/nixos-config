{
  flake.modules.nixos.hardware = { ... }: {
    networking.networkmanager.enable = true;

    # users in the "networkmanager" group are declared in users.nix
    # networking.firewall.allowedTCPPorts = [ ];
    # networking.firewall.allowedUDPPorts = [ ];
  };
}
