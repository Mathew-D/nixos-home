{ config, pkgs, ... }:

{
  imports = [
    ../base.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  services.iio-sensor-proxy.enable = true;
  services.fprintd.enable = true;
  services.thermald.enable = true;

  hardware.enableAllFirmware = true;

  environment.systemPackages = with pkgs; [
    iio-sensor-proxy
  ];

  home-manager.extraSpecialArgs = {
    hmHost = "laptop";
  };
}