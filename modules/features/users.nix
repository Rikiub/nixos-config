{
  flake.modules.nixos.users = { config, ... }: {
    users.users.${config.user.name} = {
      isNormalUser = true;
      description = config.user.label;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
