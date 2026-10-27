{
  flake.aspects.noctalia-greeter.nixos = { config, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = config.flake.user.name;
      };

      noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ config.flake.user.name ];
      };
    };
  };
}
