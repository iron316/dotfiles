# install pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.7.3
pyenv global 3.7.3

pip install --upgrade pip
pip install --user powerline-status

source .zshrc
# install virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


# install neo vim libraly
pip install pynvim
pip install --user python-language-server
