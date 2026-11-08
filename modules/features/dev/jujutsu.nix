{
  flake.aspects.jujutsu.homeManager = { user, ... }: {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = user.name;
          email = user.email;
        };
      };
    };
  };
}
