cif [ $1 = "ubuntu" ]; then
    mkdir -p ~/.local/bin
    wget --quiet https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage
    chmod u+x nvim.appimage
    mv ./nvim.appimage ~/local/bin/nvim
fi

if [ $1 = "mac" ]; then
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar xzvf nvim-macos.tar.gz
    rm nvim-macos.tar.gz
fi

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
nodenv install 14.0.0
nodenv global 14.0.0

mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sfn ~/dotfiles/neovim/coc-settings.json ~/.config/nvim/coc-settings.json
mkdir -p ~/.config/nvim/plugged
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


mkdir -p ~/.config/nvim/colors
ln -sfn ~/dotfiles/neovim/colors/lucario.vim ~/.config/nvim/colors/lucario.vim
ln -sfn ~/dotfiles/neovim/config/flake8 ~/.config/flake8
ln -sfn ~/dotfiles/neovim/config/pep8 ~/.config/pep8
ln -sfn ~/dotfiles/neovim/config/pycodestyle ~/.config/pycodestyle
ln -sfn ~/dotfiles/neovim/config/pylintrc ~/.config/pylintrc

pyenv virtualenv 3.9.1 neovim
source $(pyenv root)/versions/neovim/bin/activate
pip install --upgrade pip
pip install -U pycodestyle pylint
pip install autopep8 flake8 pynvim
deactivate
