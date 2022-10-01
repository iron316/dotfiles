# install goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv
source ~/.zshrc

# install go
goenv install 1.19.1
goenv global 1.19.1
goenv rehash
