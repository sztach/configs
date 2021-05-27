# in order to execute this file type in terminal:
# wget -O - https://raw.githubusercontent.com/sztach/configs/master/bash_commands.sh | bash

cd ~

# install tmux and download tmux configuration file
apt-get install -y tmux
curl -fLo "./.tmux.conf" https://raw.githubusercontent.com/sztach/configs/master/.tmux.conf

# install neo vim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# ./squashfs-root/AppRun --version
# mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

# vim-plug for neo vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install vim-plug for pure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download .bashrc addons and oh my bash 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
wget -O - https://raw.githubusercontent.com/sztach/configs/master/bashrc_addons >> ~/.bashrc

# install gcs fuse and mount desired bucket to vm instance
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install gcsfuse
mkdir bucket
gcsfuse cvm_boosters ./bucket

# download .vimrc file and install desired plugins
curl -fLo "./.vimrc" https://raw.githubusercontent.com/sztach/configs/master/.vimrc
vim -c "PlugInstall"

exit
