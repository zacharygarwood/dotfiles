DEPS="deps"

echo "[$DEPS] Starting install..."

sudo apt-get -y -q install build-essential
sudo apt-get -y -q install unzip
sudo apt-get -y -q install ripgrep
sudo apt-get -y -q install xclip
sudo apt-get -y -q install fontconfig

echo "[$DEPS] Done :P"
