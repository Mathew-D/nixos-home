{ pkgs, ... }:
{
  # Home Manager configuration for mdusome user
  home.username = "mdusome";
  home.homeDirectory = "/home/mdusome";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];
}