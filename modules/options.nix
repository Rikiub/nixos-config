{ lib, ... }:
{
  options.flake = {
    host = lib.mkOption {
      type = lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
          };
          system = lib.mkOption {
            type = lib.types.str;
            default = "x86_64-linux";
          };
        };
      };
    };

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
