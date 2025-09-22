{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "" ];
      wallpaper = [ "" ];
    };
  };
}
