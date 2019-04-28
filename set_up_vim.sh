cd `dirname $0`
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

mkdir -p ~/.config/nvim
ln -sfn ~/dotfiles/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/colors
ln -sfn ~/dotfiles/colors/* ~/.config/nvim/colors/*


mkdir -p ~/.cache/dein/plugs
ln -sfn ~/dotfiles/plugs/* ~/.cache/dein/plugs/
