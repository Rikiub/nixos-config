{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        # Core
        boot
        default-shell
        env
        kernel
        locale
        nix
        users

        # Programs
        nix-ld
        nx
        ssh
        sudo
      ];

      nixos = { };
    };
  };
}
