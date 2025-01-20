DEPS="deps"

echo "[$DEPS] Starting install..."

sudo apt-get -y -q install build-essential
sudo apt-get -y -q install unzip
sudo apt-get -y -q install ripgrep
sudo apt-get -y -q install xclip
sudo apt-get -y -q install fontconfig

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/jesseduffield/lazygit.git ~/dotfiles/deps/lazygit
~/dotfiles/deps/lazygit go install

sudo apt-get -y -q install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

echo "[$DEPS] Done"
