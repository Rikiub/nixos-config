{
  flake.aspects.nh.homeManager = { osConfig, ... }: {
    programs.nh = {
      enable = true;
      flake = "/home/${osConfig.flake.user.name}/.config/nixos";
    };
  };
}
