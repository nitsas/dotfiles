dotfiles_home="$HOME/.dotfiles"

function link_to_home() {
  filename=$1
  targetdir=${2:-$HOME}

  if [ -e "$HOME/$filename" ]
  then
    echo "$HOME/$filename already exists"
  else
    echo "Linking $dotfiles_home/$filename to $targetdir"
    ln -s "$dotfiles_home/$filename" "$targetdir"
  fi
}

link_to_home '.config'
link_to_home '.tmux.conf'
link_to_home '.vimrc'
link_to_home '.zshrc'
link_to_home '.inputrc'
link_to_home '.gitconfig'
ln -s $dotfiles_home/.gitignore-global ~/.gitignore
link_to_home '.tigrc'
link_to_home '.irbrc'
link_to_home '.scripts'
link_to_home '.iterm2_shell_integration.zsh'
link_to_home '.oh-my-zsh'

echo "\nNow switch iTerm2 colorscheme to 'Solarized Dark' via:"
echo "  iTerm2 Settings > Profiles > Colors > Color Presets"
