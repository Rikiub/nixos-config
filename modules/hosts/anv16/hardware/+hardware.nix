{
  flake.aspects = { aspects, ... }: {
    anv16 = {
      includes = with aspects; [
        battery
        bluetooth
        network
        nvidia
        sound
        rgb
      ];

      nixos = { inputs, ... }: {
        # General
        imports = with inputs.nixos-hardware.nixosModules; [
          ./_hardware-gen.nix
          common-pc-laptop
          common-pc-ssd
          common-cpu-intel
          common-gpu-nvidia
        ];

        # Nvidia PRIME
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
