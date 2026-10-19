{
  flake.modules.nixos.desktop = { config, lib, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = config.user.name;
      };

      noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ config.user.name ];
      };

      defaultSession = lib.mkForce "niri";
    };
  };
}
