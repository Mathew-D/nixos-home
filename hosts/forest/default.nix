{ config, pkgs, ... }: {
  imports = [
    ../../base.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "forest";

  home-manager.extraSpecialArgs = {
    hmHost = "forest";
  };
}
