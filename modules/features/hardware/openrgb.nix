{
  flake.aspects.openrgb.nixos =
    {
      pkgs,
      config,
      ...
    }:
    {
      services.hardware.openrgb = {
        enable = true;
        startupProfile = "default";
        package = pkgs.openrgb-with-all-plugins;
        motherboard =
          if config.hardware.cpu.intel.updateMicrocode then
            "intel"
          else if config.hardware.cpu.amd.updateMicrocode then
            "amd"
          else
            null;
      };
    };
}
