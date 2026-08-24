{ config, pkgs, lib, hmHost ? null, ... }:

let
  hostModule = ./hosts + "/${hmHost}.nix";
in {
  imports = [
    ./modules/core.nix
    ./modules/git.nix
    ./modules/dconf.nix
    ./modules/xdg-mime.nix
    ./modules/theme.nix
    ./modules/programs-foot.nix
    ./modules/programs-mpv.nix
    ./modules/xdg-config-files.nix
  ] ++ lib.optional (hmHost != null && builtins.pathExists hostModule) hostModule;
}
