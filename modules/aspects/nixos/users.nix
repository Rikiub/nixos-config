{
  flake.aspects.users.nixos = { user, ... }: {
    users.users.${user.name} = {
      isNormalUser = true;
      description = user.label;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
