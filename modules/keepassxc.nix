{ config, pkgs, ... }:  

{
  # Keepassxc
  programs.keepassxc = {  
    enable = true;  
    settings = {};
  };
}
