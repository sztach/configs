apt-get install -y tmux
# todo copying .tmux.conf to vm

# install neo vim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# ./squashfs-root/AppRun --version
# mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

# vim-plug for neo vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vim-plug for pure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# todo copying .vimrc to vm

vim -c "PlugInstall"
