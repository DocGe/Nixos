{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/modules/wallp/rocket_launch.jpg" ];
      wallpaper = [ ",/etc/nixos/modules/wallp/rocket_launch.jpg" ];
    };
  };
}
