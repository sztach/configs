# in order to execute this file type in terminal:
# wget -O - https://raw.githubusercontent.com/sztach/configs/master/bash_commands.sh | bash


# install tmux and download tmux configuration file
apt-get install -y tmux
curl -fLo "./.tmux.conf" https://raw.githubusercontent.com/sztach/configs/master/.tmux.conf
mv .tmux.conf ~/.tmux.conf

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

# download .vimrc file and install desired plugins
curl -fLo "./.vimrc" https://raw.githubusercontent.com/sztach/configs/master/.vimrc
mv .vimrc ~/.vimrc
vim -c "PlugInstall"

# download .bashrc addons
wget -O - https://raw.githubusercontent.com/sztach/configs/master/bashrc_addons >> ~/.bashrc

