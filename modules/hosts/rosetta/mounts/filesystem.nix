{
  flake.aspects.rosetta.nixos = { ... }: {
    fileSystems = {
      # Data Partition
      "/media/Datos" = {
        device = "/dev/disk/by-uuid/D44E1F374E1F123A";
        fsType = "ntfs";
        options = [
          "defaults"
          "noatime"
          "nofail"
          "windows_names"
        ];
      };
    };
  };
}
