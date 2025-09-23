{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/modules/wallp/explorer_green_day.jpg" ];
      wallpaper = [ ",/etc/nixos/modules/wallp/explorer_green_day.jpg" ];
    };
  };
}
