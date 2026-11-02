{
  flake.aspects.anv16.nixos =
    { ... }:
    let
      options = [
        "compress=zstd:1"
        "noatime"
      ];
    in
    {
      fileSystems = {
        "/".options = options;
        "/home".options = options;
        "/nix".options = options;
      };
    };
}
