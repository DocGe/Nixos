{ config, pkgs, ... }:

{

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      #vscodevim.vim
      #yzhang.markdown-all-in-one
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
}
