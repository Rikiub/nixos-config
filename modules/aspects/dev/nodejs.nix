{
  flake.aspects.nodejs.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [ nodejs ];
    programs.pnpm.enable = true; # NodeJS Package Manager
  };
}
