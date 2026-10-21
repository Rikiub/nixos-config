{
  flake.aspects.plymouth.nixos = { ... }: {
    boot = {
      plymouth = {
        enable = true;
      };

      # Supress logs
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
