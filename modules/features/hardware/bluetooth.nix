{
  flake.modules.nixos.hardware = { ... }: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
