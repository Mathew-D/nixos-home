{ config, pkgs, ... }:

{
programs.niri.enable = true;


  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
       xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
    ];

    config.common.default = "gtk";

};
}

