{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        defaults

        # Core
        boot
        filesystem
        kernel
        locale
        nix
        users

        # Programs
        cfg
        nix-ld
        ssh
        sudo
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
