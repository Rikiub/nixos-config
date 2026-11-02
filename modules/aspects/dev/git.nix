{
  flake.aspects.git.homeManager = { osConfig, pkgs, ... }: {
    programs = {
      git = {
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

      # Better diff
      delta = {
        enable = true;
        enableGitIntegration = true;
      };

      # Convenient TUI
      lazygit = {
        enable = true;
        enableNushellIntegration = true;
      };
    };

    home.packages = with pkgs; [
      gh # GitHub CLI
    ];
  };
}
