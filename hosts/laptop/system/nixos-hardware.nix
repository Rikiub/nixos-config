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
}
