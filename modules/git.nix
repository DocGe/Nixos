{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "user";
      user.email = "mail@mail.com";
    #settings = {
      #init.defaultBranch = "main";
      #safe.directory = "/etc/nixos";
    };
  };
}
