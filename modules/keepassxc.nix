{ config, pkgs, ... }:  

{
  # Keepassxc
  programs.keepassxc = {  
    enable = true;  
    settings = {
      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;
      };
      GUI = {
        ApplicationTheme = "dark";
      };
    };
  };
}
