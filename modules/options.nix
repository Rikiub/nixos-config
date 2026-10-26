{ lib, ... }:
with lib;
{
  flake.aspects.options.nixos = {
    options = {
      host = mkOption {
        type = types.submodule {
          options = {
            name = mkOption {
              type = types.str;
              default = "nixos";
              description = "System host name";
            };
          };
        };
      };

      user = mkOption {
        type = types.submodule {
          options = {
            name = mkOption {
              type = types.str;
              default = "rikiub";
              description = "System username";
            };
            label = mkOption {
              type = types.str;
              default = "Rikiub";
              description = "System user label";
            };
            email = mkOption {
              type = types.str;
              default = "rikiub.dev@gmail.com";
              description = "Email to use in VCS (like git)";
            };
          };
        };
      };
    };
  };
}
