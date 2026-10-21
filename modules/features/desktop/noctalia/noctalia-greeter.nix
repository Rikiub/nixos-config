{
  flake.aspects.noctalia-greeter.nixos = { config, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = config.user.name;
      };

      noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ config.user.name ];
      };
    };
  };
}
