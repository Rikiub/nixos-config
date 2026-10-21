{
  flake.aspects.battery.nixos = { lib, ... }: {
    services = {
      # Suspend on lid close
      logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
      };

      # Avoid CPU overhead on intel
      thermald.enable = true;

      # Replace power-profiles with auto-cpufreq
      power-profiles-daemon.enable = lib.mkForce false;
      auto-cpufreq = {
        enable = true;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";

            enforce_platform_profile = true;
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
      };
    };
  };
}
