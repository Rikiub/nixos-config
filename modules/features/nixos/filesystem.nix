{
  flake.aspects.filesystem.nixos = { ... }: {
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
