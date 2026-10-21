{
  flake.aspects = { aspects, ... }: {
    profile-linux.includes = with aspects; [
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
      nix
      options
      users

      # Helpers
      just-cfg

      # Programs
      nix-ld
      sudo
      git
    ];
  };
}
