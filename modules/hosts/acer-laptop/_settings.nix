{
  system = "x86_64-linux";

  options = {
    hostname = "acer-laptop";
    user = {
      name = "rikiub";
      label = "Rikiub";
    };
  };

  aspects = [
    "defaults" # Core
    "nixos" # System
    "acer-laptop" # Host

    # Groups
    "desktop"
    "shell"
    "dev"
    "media"
    "gaming"
  ];
}
