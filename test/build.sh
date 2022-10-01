docker build -t dotfiles-vm -f test/Dockerfile .
docker run --workdir /home/user/dotfiles -it dotfiles-vm zsh
