# install pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.7.3
pyenv global 3.7.3

pip install --upgrade pip
pip install --user powerline-status
pip install --user powerline-shell

source .zshrc
# install virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


# install neo vim libraly
pip install flake8 autopep8
pip install pynvim
pip install --user python-language-server
