{ inputs, ... }:

let
  input = inputs.nixos-hardware.nixosModules;
in
{
  imports = [
    input.common-pc-laptop
    input.common-pc-ssd
    input.common-cpu-intel

    input.common-gpu-nvidia
    # input.common-gpu-nvidia-sync
  ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;

    prime = {
      # Laptop bus IDs
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
