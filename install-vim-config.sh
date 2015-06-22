" Written by James Wright
" Simple environment setup script

cd ~
cp .vim .vimbackup -r
mkdir .vim
cd .vim/
mkdir autoload
mkdir bundle
cd autoload/
wget -nv -N https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim --no-check-certificate
cd ..
wget -nv -N https://raw.githubusercontent.com/james-jw/vim/master/vimrc --no-check-certificate
wget -nv -N https://raw.githubusercontent.com/james-jw/vim/master/.tmux.conf --no-check-certificate

git clone --depth=1 git@github.com:tpope/vim-surround.git bundle/vim-surround.vim
git clone --depth=1 git@github.com:james-jw/vim-xquery-syntax.git bundle/xquery-syntax.vim
git clone --depth=1 git@github.com:Townk/vim-autoclose.git bundle/autoclose.vim
git clone --depth=1 git@github.com:bling/vim-airline bundle/airline.vim
git clone --depth=1 git@github.com:scrooloose/nerdtree.git bundle/nerdtree.vim
git clone --depth=1 git@github.com:tpope/vim-fugitive.git bundle/fugitive.vim
git clone --depth=1 git@github.com:kien/ctrlp.vim.git bundle/ctrlp.vim
git clone --depth=1 git@github.com:james-jw/xqueryvim.git bundle/xqueryvim.vim
git clone --depth=1 git@github.com:aquach/vim-http-client.git bundle/http-client.vim
git clone --depth=1 git@github.com:Valloric/YouCompleteMe.git bundle/YouCompleteMe.vim
git clone --depth=1 git@github.com:tpope/vim-git.git bundle/vim-git.vim
git clone --depth=1 git@github.com:vim-scripts/dbext.vim.git bundle/dbext.vim
git clone --depth=1 git@github.com:mileszs/ack.vim.git bundle/ack.vim

sudo apt-get install libxml2-utils
sudo apt-get install silversearcher-ag

# Instal Node.js
sudo apt-get install nodejs
sudo apt-get install npm
sudo ln -s /sur/bin/nodejs /usr/bin/node

sudo npm install -g csslint
sudo npm install -g jshint
# Install You Complete Me
sudo apt-get install build-essentials cmake
sudo apt-get install python-dev
cd bundle/YouCompleteMe.vim/
git submodule update --init --recursive

sed -i '/DEFAULT_IDENTIFIER_REGEX = re.compile/c\DEFAULT_IDENTIFIER_REGEX = re.compile( r"[_a-zA-Z%\\$][\\w:\\-]*", re.UNICODE )' ~/.vim/bundle/YouCompleteMe.vim/third_party/ycmd/ycmd/identifier_utils.py

./install.sh --omnisharp-completer

printf 'Vim configuration complete!'
