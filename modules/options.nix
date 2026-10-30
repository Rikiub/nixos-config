{ lib, ... }:
{
  options.flake = {
    user = lib.mkOption {
      type = lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            default = "rikiub";
          };
          label = lib.mkOption {
            type = lib.types.str;
            default = "Rikiub";
          };
          email = lib.mkOption {
            type = lib.types.str;
            default = "rikiub.dev@gmail.com";
          };
        };
      };
      default = { };
    };
  };
}
