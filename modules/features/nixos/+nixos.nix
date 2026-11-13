{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        # Core
        boot
        system-shell
        clean
        kernel
        locale
        nix
        users
        vm

        # Programs
        fuse
        nix-ld
        nx
        ssh
        sudo
      ];

      nixos = { };
    };
  };
}
