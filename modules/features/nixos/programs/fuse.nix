{
  flake.aspects.fuse.nixos = { lib, pkgs, ... }: {
    # Compability wrapper for fuse2
    # Neccesary for mount in restic and others
    security.wrappers.fusermount = {
      setuid = true;
      owner = "root";
      group = "root";
      source = "${lib.getBin pkgs.fuse3}/bin/fusermount3";
    };
  };
}
