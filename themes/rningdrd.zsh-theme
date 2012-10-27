# rningdrd.zsh-theme
# based on af-magic.zsh-theme
#
# Author: RunningDroid
# Repo: https://github.com/runningdroid/oh-my-zsh
# Direct Link: https://github.com/runningdroid/oh-my-zsh/blob/master/themes/rningdrd.zsh-theme
#
# Created on:		October 26, 2012
# Last modified on:	October 27, 2012


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local bar
local oldsize

bars() {
if (( oldsize == ${COLUMNS} )); then
# do nothing
else
    local i=0
    bar=""
    oldsize=${COLUMNS}
    while (( i < $(( ${COLUMNS} - 30 )) )); do
        bar="${bar}-"
        i=$(($i + 1))
    done
fi
}
add-zsh-hook precmd bars

# primary prompt
PROMPT='$FG[237]${bar}%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
%{$fg[$NCOLOR]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='$my_gray%* | %D | $(cellout BAT1)%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
