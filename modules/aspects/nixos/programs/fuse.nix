{

  flake.aspects.fuse.nixos = { lib, pkgs, ... }: {
    # Compability wrapper for fusermount3
    # Neccesary for mount in restic and others
    security.wrappers.fusermount = {
      setuid = true;
      owner = "root";
      group = "root";
      source = "${lib.getBin pkgs.fuse3}/bin/fusermount3";
    };
  };
}
