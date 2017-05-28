set nocompatible

set lazyredraw

set encoding=utf-8

set termguicolors
set background=dark

" cf. <lilypond.org/doc/Documentation/usage/text-editor-support#vim-mode>
filetype off

" cf. <lilypond.org/doc/Documentation/learning/other-sources-of-information>
set runtimepath+=/usr/share/lilypond/2.18.2/vim

filetype on
syntax on

" cf. "Adding a filetype". To read this section, type
"
"         :help 43.2
"

augroup filetype-detect
        autocmd BufNewFile,BufRead ~/.xsessionrc setfiletype sh
augroup END

" Use spaces instead of tabs. This rule is broken for so few file types, though
" notably for makefiles, that it must be overridden.
set expandtab

" Always show the sign column. YouCompleteMe uses it, and it looks better for
" the text in all of the buffers to be aligned to that of each of the other
" buffers, so this ensures that, for example, the left margin of a C++ buffer
" for which YouCompleteMe has indicated errors and warnings on certain lines
" and that is open above a horizontal split with a plain text file is aligned
" with that of the plain text below.
set signcolumn=yes

set numberwidth=11
set number
set relativenumber

augroup no-relative-line-numbers-in-insert-mode
        autocmd!
        autocmd InsertEnter * setlocal norelativenumber
        autocmd InsertLeave * setlocal relativenumber
augroup END

set foldmethod=marker

set wrap
set breakat=\ 
set linebreak
set breakindent

" cf. "mode()".
let s:mode_text = {'v': 'v', 'V': 'V', '': '^V', 's': 'gh', 'S': 'gH', '': 'g^H', 'i': 'i', 'R': 'R', 'Rv': 'gR'}

" cf. below.
function! GetModeText()
        let l:mode = mode()
        if l:mode =~ 'n\|no\|t\|c\|cv\|ce\|r\|rm\|r?\|!'
                return ''
        endif
        return s:mode_text[l:mode]
endf

" cf. below.
function! GetStatusLineIsBufferModifiedText()
        if &modified
                return '+'
        endif
        return ''
endf

" Indent the status line by two columns to align it with the number column,
" which is after the sign column. The sign column is two columns wide.
set statusline=\ \ 

" Show the cursor column number left-aligned to the number column. Although
"
"         set numberwidth=11
"
" was executed, the width of the numbers themselves in the number column is one
" less than 'numberwidth', and a space follows them before the buffer text.
" Therefore, a space likewise follows the cursor column number.
set statusline+=%-10.10c\ 

" Indicate the current mode. mode() is not used here because it may return a
" literal "CTRL-V", for example, for "Visual blockwise". GetModeText() converts
" the string that mode() returns to the string that would be displayed in a
" buffer were the string that mode() returns inserted into one. Continuing the
" example, GetModeText() would convert the literal "CTRL-V" to "^V".
set statusline+=%-3.3{GetModeText()}
set noshowmode

" Pad the current mode with one column.
set statusline+=\ 

" Show a "+" if the buffer has been modified.
set statusline+=%-1.1{GetStatusLineIsBufferModifiedText()}

" Show the current file name. cf. "filename-modifiers". ``For maximum
" shortness, use `:~:'."
set statusline+=\ %-{expand('%:p:~:.')}

" vim-fugitive may not be installed yet, so it is not added to the status line
" here.

" Always show the status line.
set laststatus=2

" ``The maximum value is 10000."
set history=10000

set wildmode=list:longest

nnoremap <Leader><Space> :ls<CR>:b

" cf. <https://stackoverflow.com/a/7078429>.
cnoremap w!! w !sudo tee >/dev/null %

set backspace=indent,eol,start
set textwidth=79

set incsearch
set scrolloff=3
set hlsearch

nnoremap 0 g0
nnoremap g0 0
nnoremap ^ g^
nnoremap g^ ^
nnoremap $ g$
nnoremap g$ $
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
inoremap <Home> <C-O>g0
inoremap <End> <C-O>g$
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj
xnoremap 0 g0
xnoremap g0 0
xnoremap ^ g^
xnoremap g^ ^
xnoremap $ g$
xnoremap g$ $
xnoremap k gk
xnoremap gk k
xnoremap j gj
xnoremap gj j

nnoremap <C-P> m'O// clang-format off<Esc>jo// clang-format on<Esc>''
inoremap <C-P> <Esc>O// clang-format off<Esc>jo// clang-format on<Esc>kA
xnoremap <C-P> <Esc>'<V'>c// clang-format off<CR>clang-format on<Esc>P
nnoremap <C-N> m'O// clang-format on<Esc>jo// clang-format off<Esc>''
inoremap <C-N> <Esc>O// clang-format on<Esc>jo// clang-format off<Esc>kA
xnoremap <C-N> <Esc>'<V'>c// clang-format on<CR>clang-format off<Esc>P

let g:EclimCompletionMethod = 'omnifunc'

nnoremap <C-J> :pyf /usr/share/vim/addons/syntax/clang-format.py<CR>
inoremap <C-J> <C-O>:pyf /usr/share/vim/addons/syntax/clang-format.py<CR>
xnoremap <C-J> :pyf /usr/share/vim/addons/syntax/clang-format.py<CR>

function! s:Plug()
        call plug#begin('~/.vim/plugged')
        Plug 'ninrod/gruvbox'
        Plug 'scrooloose/nerdtree'
        Plug 'tpope/vim-fugitive'
        Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
        Plug 'jeaye/color_coded', { 'do': 'cmake . && make && make install' }
        Plug 'Valloric/YouCompleteMe', { 'do': 'PATH=\"/sbin:${PATH}\" ./install.py --clang-completer' }
        call plug#end()
endf

if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        call s:Plug()
        PlugInstall
else
        call s:Plug()
endif

let g:gruvbox_italic=0
silent! colorscheme gruvbox
syntax enable

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

set statusline+=%=%{fugitive#statusline()}

inoremap <C-\> <C-O>:execute 'normal ' . (78 - col('.')) . 'a '<CR>\<CR>
