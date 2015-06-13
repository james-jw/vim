mkdir autoload
mkdir bundle
wget -nv -N https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim --no-check-certificate autoload/pathogen.vim 
wget -nv -N https://raw.githubusercontent.com/james-jw/vim/master/vimrc vimrc --no-check-certificate

wget -nv -N https://conque.googlecode.com/files/conque_2.3.zip --no-check-certificate
unzip conque_2.3.zip bundle/
rm conque_2.3.zip

git clone --depth=1 git@github.com:tpope/vim-surround.git bundle/vim-surround.vim
git clone --depth=1 git@github.com:jeroenp/vim-xquery-syntax.git bundle/xquery-syntax.vim
git clone --depth=1 git@github.com:james-jw/vim-autoclose.git bundle/autoclose.vim
git clone --depth=1 git@github.com:scrooloose/nerdtree.git bundle/nerdtree.vim
git clone --depth=1 https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

printf 'Vim configuration complete!'
