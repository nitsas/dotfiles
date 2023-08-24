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
