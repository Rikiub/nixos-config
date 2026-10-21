{
  flake.aspects.network.nixos = { ... }: {
    networking.networkmanager.enable = true;

    # users in the "networkmanager" group are declared in users.nix
    # networking.firewall.allowedTCPPorts = [ ];
    # networking.firewall.allowedUDPPorts = [ ];
  };
}
