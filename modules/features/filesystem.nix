{
  flake.modules.nixos.filesystem = { ... }: {
    fileSystems = {
      "/media/Datos" = {
        device = "/dev/disk/by-label/Datos";
        fsType = "ntfs";
        options = [
          "defaults"
          "nofail"
        ];
      };
    };
  };
}
