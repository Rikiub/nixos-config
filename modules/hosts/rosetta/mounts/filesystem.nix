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
        ];
      };

      # Backups External Disk
      "/media/Toshiba" = {
        device = "/dev/disk/by-uuid/1A387E8F387E69A1";
        fsType = "ntfs";
        options = [
          "defaults"
          "nofail"
          "x-systemd.device-timeout=10s"
        ];
      };
    };
  };
}
