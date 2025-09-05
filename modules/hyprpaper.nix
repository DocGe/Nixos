{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/modules/wallp/andreas-slotosch-w-BSFRpfTWk-unsplash.jpg" ];
      wallpaper = [ " ,/etc/nixos/modules/wallp/andreas-slotosch-w-BSFRpfTWk-unsplash.jpg" ];
    };
  };
}
