{
  flake.aspects.nodejs.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      nodejs
      python3
    ];
    programs.pnpm.enable = true; # NodeJS Package Manager
  };
}
