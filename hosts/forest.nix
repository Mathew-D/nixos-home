{ config, pkgs, ... }: {
  imports = [
    ../base.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "forest";

  home-manager.extraSpecialArgs = {
    hmHost = "forest";
  };
}
