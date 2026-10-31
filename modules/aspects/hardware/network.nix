{
  flake.aspects.network.nixos = { ... }: {
    networking.networkmanager.enable = true;
  };
}
