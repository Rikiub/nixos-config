{
  flake.aspects.nvidia = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        nvtopPackages.nvidia
      ];
    };

    nixos = { ... }: {
      hardware.nvidia = {
        open = true;
        modesetting.enable = true;
        powerManagement = {
          enable = true;
          finegrained = true;
        };
      };

      # This MUST be overrided per host
      # services.xserver.videoDrivers = [
      #   "modesetting" # Intel
      #   "nvidia"
      # ];

      # This MUST be overrided per host
      # hardware.nvidia.prime = {
      #     intelBusId = "PCI:0:2:0";
      #     nvidiaBusId = "PCI:1:0:0";
      # };
    };
  };
}
