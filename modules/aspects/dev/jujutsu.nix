{
  flake.aspects.jujutsu.homeManager = { osConfig, ... }: {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = osConfig.user.name;
          email = osConfig.user.email;
        };
      };
    };
  };
}
