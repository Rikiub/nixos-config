{ lib, ... }:
with lib;
{
  flake.aspects.options.nixos = { ... }: {
    options = {
      host = {
        name = mkOption {
          type = types.str;
          default = "nixos";
          description = "System host name";
        };
      };

      user = {
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
      };
    };
  };
}
