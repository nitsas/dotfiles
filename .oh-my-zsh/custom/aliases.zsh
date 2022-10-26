# -
# make sure aliases work
# when we load this file in non-interactive bash (e.g. in vim)
if [ -n "$BASH" ]; then
  shopt -s expand_aliases
elif [ -n "$ZSH_NAME" ]; then
  setopt aliases
fi


# -
# jump to OLDPWD
alias cdp='cd $OLDPWD'
alias cdr='cd $(g rev-parse --show-toplevel)'
# -
# python:
# switch python versions:
alias py2='pyenv global $(pyenv versions --bare | grep "^2." | tail -1)'
alias py3='pyenv global $(pyenv versions --bare | grep "^3." | tail -1)'
# open ptpython (Python REPL)
alias ptp="ptpython"
alias pti="ptipython"
alias ip="ipython"
# -
# command shortcuts
alias v="vim"
alias vf='vim +FZF!'
alias r="ranger"
alias b="brew"
alias l="less"
alias d="diff"
alias f="fzf --height 40%"
alias s='scratch'
alias sr='scratch-rb'
# -
# git:
alias g="git"
alias gg="git grep -i"
# git grep which opens the results in a pager (like less, more, etc)
alias ggo="git grep -iO"
# git grep with support for perl regex
alias ggp="git grep -i -P"
# copy the latest commit's hash
alias glc="git log --format='%h' -n 1 | tr -d '\n' | pbcopy"
# -
# tig:
alias t="tig"
alias tigo="tig @{u}"
alias to="tig @{u}"
# -
# gist:
alias gist="gist -o"

# -
# node:
# node with wrapped in readline support (vi-bindings)
# (unfortunately this kills method name-completion)
alias node-readline="NODE_NO_READLINE=1 rlwrap node"
alias nd="node-readline"

alias npm-exec='PATH=$(npm bin):$PATH'



# -
# misc:
# create a "command" that produces a beep
alias beep='printf "\a"'
# ls aliases
# alias ls="ls -p"
alias ll="ls -lHhp"
alias la="ls -Ap"
alias lla="ls -lHhAp"
# list extra columns in ps
# alias ps="ps -j"
# make mv safe (i.e. prompt before overwriting files):
# (if I really want to overwrite the files, I use the -f option)
alias mv="mv -i "
# prettify json:
# (needs https://github.com/ddopson/underscore-cli)
alias prettify-json="underscore pretty"
alias prettify-json-no-color="underscore print"
# replace newlines with spaces:
alias newlines-to-spaces="tr '\n' ' '"
alias strip-newlines="tr -d '\n'"
# weather from http://wttr.in
# (request http://wttr.in/<city> or let it geolocate me)
alias weather="curl http://wttr.in"
# open vim scratch buffer (requires scratch.vim and BufOnly.vim plugins):
alias scratch="vim +Scratchify"
alias scratch-rb="vim +Scratchify +Ruby"
alias todo="vim ~/.todo.md"
alias todos="less ~/.todo.md"


# -
# latest
#
# fix "crontab: temp file must be edited in place" error
# (from: http://superuser.com/a/750528/128028)
# coupled with changes in vimrc
alias crontab="VIM_CRONTAB=true crontab"
#
# tree pipe to less
alias treel="tree | less"

# -
# enable completion for git & tig aliases:
if [ -n "$BASH" ]; then
  # For bash
  if type -t __git_complete > /dev/null; then
    # git
    __git_complete g __git_main
    __git_complete gd _git_diff
    __git_complete gds _git_diff
    __git_complete gco _git_checkout
    __git_complete git-fuzzy-co _git_checkout
    __git_complete gcof _git_checkout
    __git_complete git-relaxed-checkout _git_checkout
    # tig
    __git_complete t _git_checkout
    __git_complete tig _git_checkout
  fi
  # For zsh, just do `setopt no_complete_aliases` in `.zshrc`
fi

# open vim with modified files
alias vimod="vim -p \$(git status -uno --short | ack -o '(?<=UU |.M ).+')"

# -
# reload .bash_profile
alias reload="source ~/.bash_profile"


# -
# edit this file
alias aliases="vim ~/.bash_profile_sections/aliases.bash"
# edit prompt file
alias prompt="vim ~/.bash_profile_sections/prompt.bash"
# edit ~/.vimrc
alias vimrc="vim ~/.vimrc"
# edit ~/.bash_profile (aka ~/.bashrc)
alias bash-profile="vim ~/.bash_profile"
alias bashrc="bash-profile"
alias bash-profile-local="vim ~/.bash_profile_local.bash"
# edit ~/.zshrc
alias zshrc="$EDITOR ~/.zshrc"
# edit my custom zsh theme
alias zsh-theme="$EDITOR ~/.oh-my-zsh/custom/themes/sorin-nitsas.zsh-theme"
# edit ~/.inputrc
alias inputrc="vim ~/.inputrc"
# edit ~/.tmux.conf
alias tmux.conf="vim ~/.tmux.conf"
alias tmuxrc="tmux.conf"
# edit ~/.gitconfig
alias gitconfig="vim ~/.gitconfig"
alias gitrc="gitconfig"
# edit ~/.tigrc
alias tigrc="vim ~/.tigrc"
# edit ~/.ptpython/config.py
alias ptpythonrc="vim ~/.ptpython/config.py"
alias ptprc="ptpythonrc"
# edit ~/.ipython/profile_default/ipython_config.py
alias ipythonrc="vim ~/.ipython/profile_default/ipython_config.py"
alias iprc="ipythonrc"
# edit ~/.pryrc
alias pryrc="vim ~/.pryrc"

# -
alias til="vim $TILFILE"

# -
# airport for retrieving wep/wpa keys
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

# -
# browser etc:
# open 'http://localhost:3000/' in chrome
alias lhost='chrome http://localhost:3000/'
# open 'http://localhost:3000/earth' in chrome
alias learth='chrome http://localhost:3000/earth/'
alias hopen='heroku open'

# -
# httpie:
alias https='http --default-scheme=https'

# -
# rails etc:
# bundle install
alias bi="bundle install"
# bundle exec for rails
alias bx="bundle exec"
complete -F __bundle bx
alias bxr="bundle exec rails"
complete -F __rails bxr
alias br="bxr"
complete -F __rails br
alias bxk="bundle exec rake"
complete -F _rakecomplete bxk
alias bk="bxk"
complete -F _rakecomplete bk
alias bxkdm="bundle exec rake db:migrate"
alias bkdm="bxkdm"
# alias bxt="RAILS_ENV=test SPEC_ENV=js bundle exec teaspoon"
# alias bxtd="RAILS_ENV=test SPEC_ENV=js bundle exec teaspoon --format='documentation'"
# just run `yarn test`
# alias bxt="yarn test -- --no-browsers"
# alias bxtd="yarn test -- --no-browsers"
alias bxs="bundle exec rspec"
alias bxsd="bundle exec rspec --format=documentation --order=random"
alias bxsdo="bundle exec rspec --format=documentation --order=defined"
alias bxru="bundle exec ruby"
alias bru="bxru"
# run current app's rails server
alias bxrs="bundle exec rails server -b 0.0.0.0"
alias brs="bxrs"
alias bxrc="bundle exec rails console"
alias brc="bxrc"
alias bxrd="bundle exec rails dbconsole"
alias brd="bxrd"
alias bxrcts="bundle exec rails console -e test --sandbox"
alias brcts="bxrcts"
alias bxrg="bundle exec rails generate"
alias brg="bxrg"
alias bxrr="bundle exec rails runner"
alias brr="bxrr"
alias ys="yarn server"
alias bxfs="bundle exec foreman start"
