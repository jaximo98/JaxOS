{ device, ... }:

{
  shellAliases = {
    rof = "rofi -show drun; exit";
    cdj = "cd ~/JaxOS";
    cdjmd = if (device == "desktop") then "cd ~/JaxOS; make desktop" else "echo Este es el portátil, zopenco.";
    cdjml = if (device == "laptop") then "cd ~/JaxOS; make laptop" else "echo Este es el sobremesa, tifón.";

    # --- custom ---
    # Pulls the weather
    weather = "curl https://wttr.in/Malaga";
    # Print and clear the terminal with a word on it
    lol1 = "clear && printf '%*s\n' ''$(tput cols)'' | tr ' ' '-' && figlet -f fraktur -c -t Jaximo && printf '\n%*s\n' ''$(tput cols)'' | tr ' ' '-'";
    # custom script, cheathseets
    cheats= "sh ~/JaxOS/scripts/cheats.sh";

    # --- fzf ---
    f = "fzf";
    # Use fzf to search all man pages
    fman = "compgen -c | fzf | xargs man";

    # --- eza ---
    ls = "eza -a --long --sort=name --group-directories-first --icons --header --git-ignore";
    lr = "eza -a -R --long --sort=name --group-directories-first --icons --header --git-ignore";

    netdown = "sudo ip link set enp42s0 down";
    netup = "sudo ip link set enp42s0 up";

  };
}
