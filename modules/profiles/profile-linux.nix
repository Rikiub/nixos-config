{
  flake.aspects = { aspects, ... }: {
    profile-linux = {
      includes = with aspects; [
        profile-base

        # Boot
        kernel
        limine
        plymouth

        # Hardware
        bluetooth
        network
        sound

        # Core
        filesystem
        locale
        users

        # Programs
        just-cfg
        nix-ld
        sudo
        git
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
