{
  flake.modules.nixos.boot = { pkgs, ... }: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
