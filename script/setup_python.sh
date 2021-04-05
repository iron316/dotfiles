# install pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.9.1
pyenv global 3.9.1

pip install --upgrade pip

# install virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
zsh ~/.poetry/env
