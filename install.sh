#!/bin/bash

dotfiles_home="$HOME/.dotfiles"

function link_to_home() {
  name=$1
  src="$dotfiles_home/$name"
  targetname="${2:-$1}"
  target="$HOME/$targetname"

  # if [ -d "$src" ]; then
  #   echo "$src is a directory :)"
  #   mkdir -p "$target"
  #   for file in $(ls "$src"); do
  #     echo "contains: $src/$file"
  #   done
  #   return 0
  # fi

  if [ -e "$target" ]; then
    echo "$target already exists"
  else
    echo "Linking $dotfiles_home/$name to $target"
    ln -s "$dotfiles_home/$name" "$target"
  fi
}

link_to_home '.config/configstore'
link_to_home '.config/gh'
link_to_home '.config/pry'
link_to_home '.config/ranger'
mkdir -p "$HOME/.config/herdr"
link_to_home '.config/herdr/config.toml'
mkdir -p "$HOME/.config/opencode"
link_to_home '.config/opencode/cli.json'
link_to_home '.config/opencode/opencode.json'
# link_to_home '.config/systemd'
link_to_home '.tmux.conf'
link_to_home '.vimrc'
link_to_home '.vim/after'
link_to_home '.zshrc'
link_to_home '.inputrc'
link_to_home '.gitconfig'
link_to_home '.gitignore-global' '.gitignore'
link_to_home '.tigrc'
link_to_home '.irbrc'
link_to_home '.scripts'
link_to_home '.iterm2_shell_integration.zsh'
link_to_home '.oh-my-zsh'
mkdir -p "$HOME/.claude"
link_to_home '.claude/CLAUDE.md'
link_to_home '.claude/settings.json'
link_to_home '.claude/keybindings.json'
link_to_home '.claude/statusline-command.sh'
link_to_home '.claude/skills'

echo "\nNow switch iTerm2 colorscheme to 'Solarized Dark' via:"
echo "  iTerm2 Settings > Profiles > Colors > Color Presets"

# Install Solarized colorscheme in XCode:
xcode_themes_dir="$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
mkdir -p "$xcode_themes_dir"
cp "$dotfiles_home"/*.xccolortheme "$xcode_themes_dir/"
