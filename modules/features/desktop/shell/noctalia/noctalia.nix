{
  flake.aspects = { aspects, ... }: {
    noctalia = {
      includes = with aspects; [ noctalia-greeter ];

      nixos = { ... }: {
        programs = {
          noctalia = {
            enable = true;
            recommendedServices.enable = true;
          };
          gpu-screen-recorder.enable = true;
        };
      };

      homeManager = { ... }: {
        programs.noctalia = {
          enable = true;
          settings = ./noctalia.toml;
        };
      };
    };

    noctalia-greeter = {
      nixos = { user, ... }: {
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
    };
  };
}
