# in order to execute this file type in terminal:
# wget -O - https://raw.githubusercontent.com/sztach/configs/master/update.sh | bash

cd ~
current_date=$(date +"%s")

mv .bashrc .bashrc_backup_$current_date
touch .bashrc
# download .bashrc addons
wget -O - https://raw.githubusercontent.com/sztach/configs/master/bashrc_addons >> ~/.bashrc

# updating .vimrc
mv .vimrc .vimrc_backup_$current_date
# download .vimrc file and install desired plugins
curl -fLo "./.vimrc" https://raw.githubusercontent.com/sztach/configs/master/.vimrc
vim -c "PlugInstall"

exit
