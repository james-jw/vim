mkdir autoload
mkdir bundle
cd autoload
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ..
git clone --depth=1 git@github.com:scrooloose/nerdtree.git bundle/nerdtree.vim
git clone --depth=1 https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
git clone --depth=1 git@github.com:tpope/vim-surround.git bundle/vim-surround.vim
git clone --depth=1 git@github.com:jeroenp/vim-xquery-syntax.git bundle/xquery-syntax.vim
git clone --depth=1 git@github.com:james-jw/vim-autoclose.git bundle/autoclose.vim
wget https://raw.githubusercontent.com/james-jw/vim/master/vimrc
