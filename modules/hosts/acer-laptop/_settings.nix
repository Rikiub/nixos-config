{
  system = "x86_64-linux";

  host.name = "acer-laptop";
  user = {
    name = "rikiub";
    label = "Rikiub";
  };

  aspects = [
    "acer-laptop"
    "boot"
    "nixos"

    "desktop"
    "shell"
    "dev"
    "media"
    "gaming"
  ];
}
