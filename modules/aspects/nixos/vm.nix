{
  flake.aspects.vm.nixos = { user, ... }: {
    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 4096; # 4 GiB of RAM
        cores = 4; # 4 CPU cores
        diskSize = 20480; # 20 GiB disk

        # Graphics Support
        qemu.options = [
          "-device"
          "virtio-vga-gl"
          "-display"
          "gtk,gl=on,grab-on-hover=on"
        ];
      };

      users.users.${user.name} = {
        isNormalUser = true;
        initialPassword = "test"; # Testing Password
      };
    };
  };
}
