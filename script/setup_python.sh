# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zshrc

pyenv install 3.9.1
pyenv global 3.9.1

source ~/.zshrc
pip install --upgrade pip

# virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# setup poetry
curl -sSL https://install.python-poetry.org | python -

