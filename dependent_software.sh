#!/usr/bin/env bash

echo "Installing the xset clipboard for tmux-yank"

sudo apt-get install xset -y

echo "Installing dependencies for pyenv installation"

sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo "Installing pyenv"

curl https://pyenv.run | bash

pyenv install 3.9.12
pyenv virtualenv 3.9.12 local_env

echo "Installing starship"

curl -sS https://starship.rs/install.sh | sh

echo "Installing kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Installing rust"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing gitui"

curl -s curl -s https://api.github.com/repos/extrawurst/gitui/releases/latest | grep -wo "https.*linux.*gz" | wget -qi -
tar xzvf gitui-linux-musl.tar.gz
rm gitui-linux-musl.tar.gz
sudo chmod +x gitui
sudo mv gitui /usr/local/bin

echo "Installing k9s for Kubernetes cluster management"
curl -sS https://webi.sh/k9s | sh

echo "Installing hugo for personal blog developement"
sudo snap install hugo
