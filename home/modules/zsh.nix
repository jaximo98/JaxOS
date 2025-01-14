{pkgs, device, ...}:
let
  shellAliases = import ./shell_aliases.nix { inherit device; };
in
{

  home.packages = with pkgs; [
    pure-prompt
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    initExtra = ''

      if [ -n "''${commands[fzf-share]}" ]; then
        source "''$(fzf-share)/key-bindings.zsh"
        source "''$(fzf-share)/completion.zsh"
      fi

      fpath+=("~/JaxOS/themes/zsh_theme")
      autoload -U promptinit; promptinit
      prompt pure
    '';

    shellAliases = shellAliases.shellAliases;

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
    };
  };


}