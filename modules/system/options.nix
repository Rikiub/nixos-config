{ lib, ... }:

with lib;
{
  options = {
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
}
