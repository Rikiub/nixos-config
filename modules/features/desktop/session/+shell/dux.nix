{
  flake.aspects.dux.nixos = { inputs, pkgs, ... }: {
    programs.dms-shell = {
      enable = true;
      package = inputs.dux.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
