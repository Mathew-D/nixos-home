{ config, pkgs, ... }: {
  imports = [
    ../base.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  home-manager.extraSpecialArgs = {
    hmHost = "laptop";
  };
}
