{
  flake.aspects.nodejs.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [ nodejs ];

    # Package Managers
    programs.npm.enable = true;
    programs.pnpm.enable = true;
  };
}
