{
  flake.aspects.dux.nixos = { ... }: {
    programs.dux-shell = {
      enable = true;
    };
  };
}
