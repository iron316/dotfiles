# install nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
mkdir ~/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
source ~/.zshrc

# insatll node
nodenv install 18.9.1
nodenv global 18.9.1
nodenv rehash
