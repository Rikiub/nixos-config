{
  flake.aspects.git.homeManager = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        user.name = "Rikiub";
        user.email = "rikiub.dev@gmail.com";

        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
