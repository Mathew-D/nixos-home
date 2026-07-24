{ config, pkgs, ... }: {
  imports = [
    ../../base.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "main";

  home-manager.extraSpecialArgs = {
    hmHost = "main";
  };
}
