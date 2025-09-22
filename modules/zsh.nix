{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      upd = "sudo nix-channel --update";
    };
    
  };


}
