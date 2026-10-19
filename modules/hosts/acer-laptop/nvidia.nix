{
  flake.modules.homeManager.host-acer-laptop = { pkgs, ... }: {
    home.packages = with pkgs; [
      nvtopPackages.nvidia
    ];
  };

  flake.modules.nixos.host-acer-laptop = { ... }: {
    services.xserver.videoDrivers = [
      "modesetting" # Intel
      "nvidia"
    ];

    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
