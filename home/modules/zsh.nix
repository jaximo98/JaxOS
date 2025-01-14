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

      zstyle :prompt:pure:path color "#83a598"
      zstyle :prompt:pure:git:branch color "#fe8019"
      zstyle :prompt:pure:git:dirty color "#fb4934"
      zstyle :prompt:pure:prompt:success color "#b8bb26"
      zstyle :prompt:pure:prompt:continuation color "#fe8019"
      zstyle :prompt:pure:prompt:error color "#fb4934"
      zstyle :prompt:pure:git:arrow color "#8ec07c"
      zstyle :prompt:pure:execution_time color "#fabd2f"
      zstyle :prompt:pure:git:stash color "#8ec07c"
      zstyle :prompt:pure:git:action color "#fabd2f"
      zstyle :prompt:pure:host color "#fe8019"
      zstyle :prompt:pure:user color "#fe8019"
      zstyle :prompt:pure:virtualenv color "#fabd2f"


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