{
  flake.aspects.nvidia = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        nvtopPackages.nvidia
      ];
    };

    nixos = { ... }: {
      # Add CUDA cache
      nix.settings = {
        extra-substituters = [
          "https://cache.nixos-cuda.org"
        ];
        extra-trusted-public-keys = [
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
      };

      # Configure NVIDIA Grapchics
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
