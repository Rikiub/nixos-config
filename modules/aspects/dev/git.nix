{
  flake.aspects.git.homeManager = { osConfig, ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = osConfig.flake.user.name;
          email = osConfig.flake.user.email;
        };

        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };
    programs.lazygit = {
      enable = true;
      enableNushellIntegration = false;
    };
  };
}
