{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    qt6Packages.qt6ct
    adwaita-icon-theme
    qogir-theme
    pkgs.pywalfox-native
  ];
}
