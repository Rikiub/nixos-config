{
  flake.aspects.env.nixos = { ... }: {
    environment.localBinInPath = true;
  };
}
