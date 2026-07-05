{ config, pkgs, ... }:

let
  ish-fw = pkgs.runCommand "intel-ish-firmware" {} ''
    install -Dm644 ${./firmware/ishS_MEU_aligned.bin} \
      $out/lib/firmware/intel/ish/ish_lnlm.bin
  '';
in
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

  hardware.firmware = [
    ish-fw
  ];

  environment.systemPackages = with pkgs; [
    iio-sensor-proxy
  ];

  home-manager.extraSpecialArgs = {
    hmHost = "laptop";
  };
}