{
  flake.aspects.bluetooth.nixos = { ... }: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
