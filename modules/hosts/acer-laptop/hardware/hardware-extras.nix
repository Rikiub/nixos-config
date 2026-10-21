{
  flake.aspects = { aspects, ... }: {
    acer-laptop = {
      includes = with aspects; [
        battery
        bluetooth
        network
        sound
        nvidia
      ];

      nixos = { inputs, ... }: {
        imports = with inputs.nixos-hardware.nixosModules; [
          common-pc-laptop
          common-pc-ssd
          common-cpu-intel
          common-gpu-nvidia
        ];

        services.xserver.videoDrivers = [
          "modesetting" # Intel
          "nvidia"
        ];

        hardware.nvidia.prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
      homeManager = { ... }: { };
    };
  };
}
