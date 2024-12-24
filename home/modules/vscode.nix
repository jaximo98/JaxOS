{ pkgs, ...}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Gruvbox Material Dark";
    };
    extensions = with pkgs.vscode-extensions; [
      golang.go
      jdinhlife.gruvbox
      jnoortheen.nix-ide
      naumovs.color-highlight
    ];
  };
}