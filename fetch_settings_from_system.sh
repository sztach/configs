VERSION=$(git log -1 --format="%h-%cd" --date=iso-strict)

echo "copying vimrc..."
cp ~/.vimrc ./vimrc

echo "copying zshrc..."
cp ~/.zshrc ./zshrc

