mkdir autoload
mkdir bundle
cd autoload
wget -nv -N https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim --no-check-certificate
cd ..
wget -nv -N https://raw.githubusercontent.com/james-jw/vim/master/vimrc --no-check-certificate

git clone --depth=1 git@github.com:tpope/vim-surround.git bundle/vim-surround.vim
git clone --depth=1 git@github.com:james-jw/vim-xquery-syntax.git bundle/xquery-syntax.vim
git clone --depth=1 git@github.com:scrooloose/nerdtree.git bundle/nerdtree.vim
git clone --depth=1 git@github.com:kien/ctrlp.vim.git bundle/ctrlp.vim

printf 'Vim configuration complete!'
