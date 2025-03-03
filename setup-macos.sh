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
ssh-add --apple-use-keychain ~/.ssh/id_ed25519


# --- Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# --- Install packages

# get latest versions of package definitions
brew update

brew install zsh git tig vim ranger fzf \
  ack            # Needed for alias `vimod`


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
