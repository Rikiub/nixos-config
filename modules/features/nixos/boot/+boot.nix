{
  flake.aspects = { aspects, ... }: {
    boot = {
      includes = with aspects; [
        limine
        plymouth
      ];

      nixos = { };
    };
  };
}
