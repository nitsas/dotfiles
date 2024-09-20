# NOTE: This isn't fully automatic. Some commands are optional, so they are commented out.


# --- Variables

# Which email to use for ssh etc?
EMAIL="nitsas.chris@gmail.com"


# --- SSH

# Generate ssh public/private key
ssh-keygen -t ed25519 -C $EMAIL
# Enable ssh-agent in the shell
eval "$(ssh-agent -s)"
# Add SSH key to SSH agent
ssh-add ~/.ssh/id_ed25519


# --- Install packages

# get latest versions of package definitions
sudo apt update

sudo apt-get install \
  zsh git curl tmux ranger fzf tig calibre \
  vim-gtk3     \ # enable vim to talk to the system clipboard
  wl-clipboard \ # wl-copy & wl-paste utilities to connect tmux to system clipboard
  golang-go    \ # Go language
  gopls          # Go language server for editor code completion


# --- Set up Zsh as my default shell

chsh -s $(which zsh)

# --- Vim

# Install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Then when you open vim, :PlugInstall


# --- nitsas dotfiles

mkdir -p ~/repos/github/nitsas
cd ~/repos/github/nitsas
git clone git@github.com:nitsas/dotfiles.git
ln -s ~/.dotfiles ~/repos/github/nitsas/dotfiles
cd ~/.dotfiles
./install.sh
cd

# --- Terminal colors

# Check if terminal supports truecolor:
# awk 'BEGIN{\
#     s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;\
#     for (colnum = 0; colnum<77; colnum++) {\
#         r = 255-(colnum*255/76);\
#         g = (colnum*510/76);\
#         b = (colnum*255/76);\
#         if (g>255) g = 510-g;\
#         printf "\033[48;2;%d;%d;%dm", r,g,b;\
#         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;\
#         printf "%s\033[0m", substr(s,colnum+1,1);\
#     }\
#     printf "\n";\
# }'


# --- DNS

# Change DNS servers via command-line-GUI on Ubuntu 24
# nmtui
# Then try it out using: resolvectl status
# Or using: dig www.google.com


# --- Misc

# Check Ubuntu version via command line
# lsb_release -a


# --- Install docker
# https://www.jpaul.me/2024/07/how-to-install-docker-on-a-raspberry-pi-5/

echo '[STEP] Installing docker prerequisites...'

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo '[STEP] Installing docker...'
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo '[STEP] To run docker commands without sudo, add yourself to group "docker"...'
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo '[STEP] Checking if docker works...'
docker run hello-world

echo '[STEP] Install docker-compose in place of "docker compose"...'
sudo touch /usr/bin/docker-compose
echo 'docker compose --compatibility "$@"' | sudo tee /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
