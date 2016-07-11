" Disable compatibility with vi
set nocompatible

" Vundle plugin manager
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'VundleVim/Vundle.vim.git'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

Plugin 'sheerun/vim-polyglot'
" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" Base 16 color scheme
Plugin 'chriskempson/base16-vim'

call vundle#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on
" End of Vundle plugin manager block

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
"set t_Co=16
syntax on
if (has("termguicolors"))
    set termguicolors
endif

"Atoms one dark theme
"colorscheme onedark
colorscheme base16-chalk
set background=dark
let base16colorspace=256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
"let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>


