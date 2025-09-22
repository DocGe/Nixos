{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "user";
    userEmail = "mail@mail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
