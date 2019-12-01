curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
zsh ~/.poetry/env
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.zshrc
poetry self:update
echo "fpath+=~/.zfunc" >> .zshrc
mkdir ~/.zfunc # ないなら
poetry completions zsh > ~/.zfunc/_poetry
compinit
