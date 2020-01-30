cd `dirname $0`
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -sfn ~/dotfiles/colors/lucario.vim ~/.config/nvim/colors/lucario.vim
ln -sfn ~/dotfiles/config/flake8 ~/.config/flake8
ln -sfn ~/dotfiles/config/pep8 ~/.config/pep8

mkdir -p ~/.cache/dein/plugs
ln -sfn ~/dotfiles/dein.toml ~/.cache/dein/plugs/dein.toml

pyenv virtualenv neovim
pyenv activate neovim
pip install -U python-language-server
pip install jedi==0.15.0
pip install isort autopep8 flake8 pynvim
pyenv deactivate
