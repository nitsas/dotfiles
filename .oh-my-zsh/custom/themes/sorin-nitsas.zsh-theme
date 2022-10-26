# sorin.zsh-theme customized by nitsas
# original screenshot: https://i.imgur.com/aipDQ.png

# "What do the git variables mean?":
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

  PROMPT='%{$fg[red]%}%3c%{$fg[green]%}$(git_prompt_info)$(git_prompt_status)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=" ("
  ZSH_THEME_GIT_PROMPT_SUFFIX=")"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}'

  ZSH_THEME_GIT_PROMPT_ADDED="+"
  ZSH_THEME_GIT_PROMPT_MODIFIED="*"
  ZSH_THEME_GIT_PROMPT_DELETED="-"
  ZSH_THEME_GIT_PROMPT_RENAMED="➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="═"
else
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"

  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
