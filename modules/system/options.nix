{ lib, ... }:

with lib;
{
  options = {
    externalHome = mkOption {
      type = types.str;
      default = "/media/Datos/Personal";
      description = "External directory where I save my stuff";
    };

    user = {
      name = mkOption {
        type = types.str;
        default = "rikiub";
        description = "System username";
      };
      label = mkOption {
        type = types.str;
        default = "NixOS";
        description = "System user label";
      };
    };
  };
}
