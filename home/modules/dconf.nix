{ ... }:
{
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
}