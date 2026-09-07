{ lib, ... }:

{
  imports = [
    ./mdusome.nix
  ];

  home.username = lib.mkForce "school";
  home.homeDirectory = lib.mkForce "/home/school";
}
