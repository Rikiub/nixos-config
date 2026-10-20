{
  flake.modules.homeManager.dev-tools = { pkgs, ... }: {
    home.packages = with pkgs; [
      just # Task Runner
    ];

    programs = {
      gh.enable = true; # GitHub CLI
      uv.enable = true; # Python Manager
      pnpm.enable = true; # NodeJS Package Manager
    };
  };
}
