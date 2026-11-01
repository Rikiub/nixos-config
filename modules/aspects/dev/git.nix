{
  flake.aspects.git.homeManager = { osConfig, pkgs, ... }: {
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

    # GitHub CLI
    home.packages = with pkgs; [ gh ];

    # Better diff
    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };

    # Convenient TUI
    programs.lazygit = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
