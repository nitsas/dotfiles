export GOPATH="$HOME/go"

# If you come from bash you might have to change your $PATH.
PATH="$PATH:$HOME/.scripts/bin:."
PATH="$PATH:$GOPATH/bin"
# PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sorin-nitsas"
# ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=(
  "clean"
  "cloud"
  "flazz"
  "kolo"
  "lambda"
  "lukerandall"
  "risto"
  "simple"
  "sorin"
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # TEMP:
  # bundler
  # coffee
  # common-aliases
  # compleat
  docker
  docker-compose
  # encode64
  extract
  fzf
  # gem
  git
  # gitfast
  httpie
  # history
  # jsontools
  # mix
  # node
  npm
  pip
  # pyenv
  # python
  # rails
  rbenv
  # redis-cli
  # ruby
  # tmux
  # tmuxinator
  urltools
  vi-mode
  yarn
  z
)

# Set up homebrew's autocompletions:
# (must run before we source oh-my-zsh.sh)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit -u -d $ZSH/cache/.zcompdump-$HOST
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# Make sure autocompletion works for aliases
setopt no_complete_aliases

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor
export EDITOR=vim

# Set options for `less`
# see: https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
# export LESS="--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Press up/down to search the command history
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward
# Find exact key codes by pressing Ctrl-v and then the key

# Fix Delete key. Make it forward delete instead of capitalizing.
bindkey "\e[3~" delete-char

# Enable iterm2's shell integration.
# https://www.iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
