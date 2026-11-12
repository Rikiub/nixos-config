{
  flake.aspects = {
    dux-shell.nixos = { ... }: {
      programs.dux-shell = {
        enable = true;
      };
    };

    dux-greeter.nixos = { ... }: {
      services.displayManager.dux-greeter = {
        enable = true;
      };
    };
  };
}
