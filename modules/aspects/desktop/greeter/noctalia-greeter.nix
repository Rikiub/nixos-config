{
  flake.aspects.noctalia-greeter.nixos = { user, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = user.name;
      };

      noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ user.name ];
      };
    };
  };
}
