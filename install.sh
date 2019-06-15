dotfiles_home="$HOME/.dotfiles"

function link_to_home() {
  filename=$1

  if [ -e "$HOME/$filename" ]
  then
    echo "$HOME/$filename already exists"
  else
    echo "Linking $dotfiles_home/$filename to $HOME/$filename"
    ln -s "$dotfiles_home/$filename" "$HOME"
  fi
}

link_to_home '.config'
link_to_home '.vimrc'
link_to_home '.zshrc'
