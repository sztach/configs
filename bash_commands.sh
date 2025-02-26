# in order to execute this file type in terminal:
# wget -O - https://raw.githubusercontent.com/sztach/configs/master/bash_commands.sh | bash

cd ~

# install tmux and download tmux configuration file
apt-get install -y tmux
curl -fLo "./.tmux.conf" https://raw.githubusercontent.com/sztach/configs/master/.tmux.conf

# install vim-plug for pure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download .bashrc addons and oh my bash 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
wget -O - https://raw.githubusercontent.com/sztach/configs/master/bashrc_addons >> ~/.bashrc

# install linter and formatter
sudo apt-get install -y black
sudo apt-get install -y flake8

# download .vimrc file and install desired plugins
curl -fLo "./.vimrc" https://raw.githubusercontent.com/sztach/configs/master/.vimrc
vim -c "PlugInstall"

exit
