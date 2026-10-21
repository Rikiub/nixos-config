{
  system = "x86_64-linux";

  host.name = "acer-laptop";
  user = {
    name = "rikiub";
    label = "Rikiub";
  };

  aspects = [
    "acer-laptop"

    "system-linux"
    "shell"
    "dev"
    "desktop"
  ];
}
