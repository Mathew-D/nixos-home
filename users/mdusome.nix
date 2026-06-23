{ pkgs, ... }:

{
  users.users.mdusome = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
