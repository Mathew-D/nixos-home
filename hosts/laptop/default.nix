{ config, pkgs, lib, ... }:

let
  localIshFirmware = /etc/nixos/local-firmware/ishS_MEU_aligned.bin;
  hasLocalIshFirmware = builtins.pathExists localIshFirmware;

  ish-fw = if hasLocalIshFirmware then pkgs.runCommand "intel-ish-firmware" { src = localIshFirmware; } ''
    install -Dm644 "$src" \
      $out/lib/firmware/intel/ish/ish_lnlm.bin
  '' else null;
in

{
  imports = [
    ../../base.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

#  services.fprintd.enable = true;
  services.thermald.enable = true;

#  hardware.enableAllFirmware = true;

  warnings = lib.optional (!hasLocalIshFirmware) ''
    Intel ISH firmware not found at ${toString localIshFirmware}. Place the blob there to enable it on laptop.
  '';

  hardware.firmware = lib.optional hasLocalIshFirmware ish-fw;
swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024;
    }
  ];

  environment.systemPackages = with pkgs; [
    iio-sensor-proxy
  ];

  home-manager.extraSpecialArgs = {
    hmHost = "laptop";
  };
}
