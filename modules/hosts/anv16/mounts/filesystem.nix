{
  flake.aspects.anv16.nixos = { ... }: {
    fileSystems = {
      "/media/Datos" = {
        device = "/dev/disk/by-label/Datos";
        fsType = "ntfs";
        options = [
          "defaults"
          "noatime"
          "nofail"
        ];
      };
    };
  };
}
