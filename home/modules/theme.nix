{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "breeze-dark";
    };
    font = {
      name = "Roboto";
      size = 11;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      size = 34;
    };
    gtk3 = {
      extraConfig = {
        gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 0;
        gtk-menu-images = 0;
        gtk-enable-event-sounds = 1;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
        gtk-application-prefer-dark-theme = 1;
      };
      extraCss = ''@import url("noctalia.css");'';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "adwaita";
  };
}