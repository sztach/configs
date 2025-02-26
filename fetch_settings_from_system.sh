cp ~/.vimrc ./vimrc

VERSION=$(git log -1 --format="%h-%cd" --date=iso-strict)
cp ~/.zshrc ./zshrc
echo "copied zshrc version: $VERSION" >> ./zshrc

