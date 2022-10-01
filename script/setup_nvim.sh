# download nvim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# mv ./squashfs-root/usr/bin/nvim ~/.local/bin

# link nvim files
mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sfn ~/dotfiles/neovim/coc-settings.json ~/.config/nvim/coc-settings.json
mkdir -p ~/.config/nvim/plugged
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# python
pyenv virtualenv 3.9.1 neovim
source $(pyenv root)/versions/neovim/bin/activate
pip install --upgrade pip
pip install -U pylint black isort pynvim
deactivate

# docker 
npm install -g dockerfile-language-server-nodejs

# go
go install golang.org/x/tools/gopls@latest
