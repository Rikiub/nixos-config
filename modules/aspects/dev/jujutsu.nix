{
  flake.aspects.jujutsu.homeManager = { osConfig, ... }: {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = osConfig.flake.user.name;
          email = osConfig.flake.user.email;
        };
      };
    };
  };
}
