{ config, pkgs, lib, hmHost ? null, ... }:

let
  hostModule = ./hosts + "/${hmHost}.nix";
in {
  imports = lib.optional (hmHost != null && builtins.pathExists hostModule) hostModule;

  # Home Manager configuration for mdusome user
  home.username = "mdusome";
  home.homeDirectory = "/home/mdusome";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    settings = {
      user.name = "Mathew-D";
      user.email = "mathew_dusome@kprdsb.ca";
    };
  };

  programs.home-manager.enable = true;

  dconf.settings = {
    "org/nemo/preferences" = {
      click-policy = "double";
      date-format = "iso";
      show-advanced-permissions = true;
      show-hidden-files = true;
      show-toggle-extra-pane-toolbar = true;
      size-prefixes = "base-10";
      tooltips-in-icon-view = false;
      tooltips-in-list-view = false;
    };

    "org/nemo/preferences/menu-config" = {
      selection-menu-open-as-root = false;
      selection-menu-open-in-new-tab = true;
      selection-menu-pin = false;
    };

    "org/cinnamon/desktop/applications/terminal" = {
      exec = "foot";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/mailto" = [ "org.mozilla.Thunderbird.desktop" "userapp-Thunderbird-DJ0RQ2.desktop" ];
      "message/rfc822" = [ "userapp-Thunderbird-DJ0RQ2.desktop" ];
      "x-scheme-handler/mid" = [ "userapp-Thunderbird-DJ0RQ2.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "video/mp4" = [ "io.github.celluloid_player.Celluloid.desktop" ];
      "video/quicktime" = [ "mpc-qt.desktop" ];
      "video/x-ms-wmv" = [ "mpc-qt.desktop" ];
      "video/x-flv" = [ "mpc-qt.desktop" ];
      "video/vnd.avi" = [ "mpc-qt.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
      "application/x-wayland-gnome-saved-search" = [ "nemo.desktop" ];
      "text/plain" = [ "org.gnome.gedit.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "application/x-zerosize" = [ "libreoffice-writer.desktop" ];
      "audio/mpeg" = [ "mpc-qt.desktop" ];
      "video/x-matroska" = [ "mpc-qt.desktop" ];
      "application/pdf" = [ "masterpdfeditor4.desktop" "firefox.desktop" "chromium.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "libreoffice-writer.desktop" ];
      "audio/mp4" = [ "mpc-qt.desktop" ];
      "application/clarisworks" = [ "libreoffice-calc.desktop" "libreoffice-draw.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "audio/flac" = [ "mpc-qt.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "model/stl" = [ "com.bambulab.BambuStudio.desktop" ];
      "application/octet-stream" = [ "org.gnome.gedit.desktop" ];
      "text/x-qml" = [ "org.gnome.gedit.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];
      "application/x-extension-htm" = [ "firefox.desktop" ];
      "application/x-extension-html" = [ "firefox.desktop" ];
      "application/x-extension-shtml" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "application/x-extension-xhtml" = [ "firefox.desktop" ];
      "application/x-extension-xht" = [ "firefox.desktop" ];
    };

    associations.added = {
      "x-scheme-handler/mailto" = [ "userapp-Thunderbird-DJ0RQ2.desktop" ];
      "x-scheme-handler/mid" = [ "userapp-Thunderbird-DJ0RQ2.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" "org.gnome.Loupe.desktop" ];
      "video/mp4" = [ "mpc-qt.desktop" "vlc.desktop" "io.github.celluloid_player.Celluloid.desktop" "mpv.desktop" "kokovp.desktop" ];
      "video/quicktime" = [ "mpc-qt.desktop" ];
      "video/x-ms-wmv" = [ "mpc-qt.desktop" ];
      "video/x-flv" = [ "mpc-qt.desktop" ];
      "video/vnd.avi" = [ "mpc-qt.desktop" ];
      "text/javascript" = [ "org.gnome.gedit.desktop" ];
      "text/plain" = [ "org.gnome.gedit.desktop" ];
      "image/png" = [ "swappy.desktop" "org.gnome.eog.desktop" "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.eog.desktop" ];
      "text/x-csrc" = [ "org.gnome.gedit.desktop" ];
      "video/webm" = [ "mpc-qt.desktop" ];
      "application/pdf" = [ "firefox.desktop" "masterpdfeditor4.desktop" ];
      "application/x-zerosize" = [ "org.gnome.gedit.desktop" "libreoffice-writer.desktop" ];
      "application/x-shellscript" = [ "org.gnome.gedit.desktop" ];
      "audio/mpeg" = [ "mpc-qt.desktop" ];
      "text/x-log" = [ "libreoffice-writer.desktop" ];
      "application/json" = [ "org.gnome.gedit.desktop" ];
      "video/x-matroska" = [ "mpc-qt.desktop" ];
      "application/octet-stream" = [ "org.gnome.gedit.desktop" ];
      "text/x-qml" = [ "org.gnome.gedit.desktop" ];
      "image/svg+xml" = [ "org.gnome.eog.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "application/x-extension-htm" = [ "firefox.desktop" ];
      "application/x-extension-html" = [ "firefox.desktop" ];
      "application/x-extension-shtml" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "application/x-extension-xhtml" = [ "firefox.desktop" ];
      "application/x-extension-xht" = [ "firefox.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
    };
  };

  xdg.configFile."mimeapps.list".force = true;

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "adwaita";
  };

  # XDG configuration files (converted from skel)
  xdg.configFile = {
    "foot/foot.ini".text = builtins.readFile ./skel/foot/foot.ini;
    "foot/dank-colors.ini".text = builtins.readFile ./skel/foot/dank-colors.ini;
    "niri/src/animations.kdl".text = builtins.readFile ./skel/niri/src/animations.kdl;
    "niri/machines/forest.kdl".text = builtins.readFile ./skel/niri/machines/forest.kdl;
    "niri/machines/main.kdl".text = builtins.readFile ./skel/niri/machines/main.kdl;
    "niri/machines/laptop.kdl".text = builtins.readFile ./skel/niri/machines/laptop.kdl;
    "niri/src/input.kdl".text = builtins.readFile ./skel/niri/src/input.kdl;
    "niri/src/layout.kdl".text = builtins.readFile ./skel/niri/src/layout.kdl;
    "niri/src/misc.kdl".text = builtins.readFile ./skel/niri/src/misc.kdl;
    "niri/src/spawn.kdl".text = builtins.readFile ./skel/niri/src/spawn.kdl;
    "noctalia/noctalia-config.toml".text = builtins.readFile ./skel/noctalia/noctalia-config.toml;
    "gtk-3.0/bookmarks".text = builtins.readFile ./skel/gtk-3.0/bookmarks;
    "gtk-3.0/gtk.css".text = builtins.readFile ./skel/gtk-3.0/gtk.css;
    "gtk-3.0/settings.ini".text = builtins.readFile ./skel/gtk-3.0/settings.ini;
  };
}
