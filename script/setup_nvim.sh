if [ -e /etc/redhat-release | -e /etc/system-relase];then
    mkdir -p ~/local/bin
    wget --quiet https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract > /dev/null
    mv ./squashfs-root ~/local/bin/
    ln -s ~/local/bin/squashfs-root/usr/bin/nvim ~/local/bin/nvim
else
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar xzvf nvim-macos.tar.gz
    rm nvim-macos.tar.gz
fi
git clone https://github.com/Shougo/dein.vim.git ~/.cache/dein/repos/github.com/Shougo/dein.vim
mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -sfn ~/dotfiles/neovim/colors/lucario.vim ~/.config/nvim/colors/lucario.vim
ln -sfn ~/dotfiles/neovim/config/flake8 ~/.config/flake8
ln -sfn ~/dotfiles/neovim/config/pep8 ~/.config/pep8
ln -sfn ~/dotfiles/neovim/config/pycodestyle ~/.config/pycodestyle
ln -sfn ~/dotfiles/neovim/config/pylintrc ~/.config/pylintrc

mkdir -p ~/.cache/dein/plugs
ln -sfn ~/dotfiles/neovim/dein.toml ~/.cache/dein/plugs/dein.toml

pyenv virtualenv 3.9.1 neovim
source $(pyenv root)/versions/neovim/bin/activate
pip install --upgrade pip
pip install -U python-language-server
pip install pyls-isort pyls-black jedi
pip install autopep8 flake8 pynvim
deactivate
