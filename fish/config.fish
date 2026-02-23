set -gx MICRO_TRUECOLOR 1
set -g fish_greeting "" 
set -x DBUS_SESSION_BUS_ADDRESS unix:path=/run/user/1000/bus

# git
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_char_dirtystate "●"
set -g __fish_git_prompt_char_untrackedfiles "ツ"

function fish_prompt
    set -l crust 11111b
    set -l blue 89b4fa
    set -l sapphire 74c7ec
    set -l mauve cba6f7
    set -l green a6e3a1
    set -l red f38ba8

    if test $status -ne 0
        set -l arrow_color $red
    else
        set -l arrow_color $mauve
    end

    set_color $blue; echo -n ""
    set_color -b $blue $crust; echo -n " user@$hostname"
    set_color normal; set_color $blue; echo -n " "
    set_color $sapphire; echo -n ""
    set_color -b $sapphire $crust; echo -n "󰉖 "(prompt_pwd)
    set_color normal; set_color $sapphire; echo -n " "
    set -l git_info (fish_vcs_prompt | string trim -c " ()")
    if test -n "$git_info"
        set -l git_color $green
        if string match -q "*●*" "$git_info"
            set git_color $red
        end
        set_color $git_color; echo -n ""
        set_color -b $git_color $crust; echo -n "󰊤 ""$git_info"
        set_color normal; set_color $git_color; echo -n " "
    end
    echo 
    echo -n " ▶ "
end

if status is-interactive
    abbr -a gs 'git status'
    abbr -a ga 'git add'
    abbr -a gc 'git commit -m'
    abbr -a gp 'git pull'
    abbr -a grm 'git rm'
    
    if type -q fastfetch
        fastfetch
    end
end
