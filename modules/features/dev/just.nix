{
  flake.aspects.just.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      just # Task Runner
    ];
  };
}
