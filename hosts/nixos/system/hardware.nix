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

  # Suspend on lid close
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
  };

  # Avoid CPU overhead on intel
  services.thermald.enable = true;
}
