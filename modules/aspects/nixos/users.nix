{
  flake.aspects.users.nixos = { config, ... }: {
    users.users.${config.flake.user.name} = {
      isNormalUser = true;
      description = config.flake.user.label;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
