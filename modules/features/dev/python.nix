{
  flake.aspects.python.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [ python3 ]; # Python system-wide
    programs.uv.enable = true; # Python Toolchain
  };
}
