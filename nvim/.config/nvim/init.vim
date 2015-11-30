fu! s:S_ft__register__pat_List(filetype, pattern_List)
        exe 'aug ' . a:filetype
                au!
                for l:pat in a:pattern_List
                        exe 'au BufNewFile,BufRead l:pat se ft=' . a:filetype
                endfo
        aug end
endf

fu! s:S_register(filetype__pattern_List__dict)
        for [l:filetype, l:pattern_List] in items(a:filetype__pattern_List__dict)
                cal s:S_ft__register__pat_List(l:filetype, l:pattern_List)
        endfo
endf

let s:filetype__pattern_List__dict = {'sh': ['~/.xsessionrc']}

cal s:S_register(s:filetype__pattern_List__dict)

let g:stl_mode = {'v': 'v', 'V': 'V', '': '^V', 's': 'gh', 'S': 'gH', '': 'g^H', 'i': 'i', 'R': 'R', 'Rv': 'gR'}
fu! S_stl_mode()
        let l:mode = mode()
        if l:mode =~ 'n\|no\|t\|c\|cv\|ce\|r\|rm\|r?\|!'
                retu ' '
        en
        retu g:stl_mode[l:mode]
endf
fu! S_stl_mod()
        if &mod
                retu '+'
        en
        retu ' '
endf
se stl=\ \ \ %-10.10c\ %-3.3{S_stl_mode()}\ %-1.1{S_stl_mod()}\ %-{expand('%:p:~:.')}
se ls=2

fu! S_sig_place()
        sig define sig
        exe 'sig place 9999 line=1 name=sig buffer=' . bufnr('$')
endf
aug display_sign_column
        au!
        au BufAdd * cal S_sig_place()
aug end
cal S_sig_place()

aug i_nornu
        au!
        au InsertEnter * setl nornu
        au InsertLeave * setl rnu
aug end
se nuw=11
se rnu nu

cno w!! w !sudo tee >/dev/null %
nn <Leader><Space> :ls<CR>:b
se et
let g:netrw_liststyle = 3
se nosmd

se wrap lbr
nn 0 g0
nn ^ g^
nn $ g$
nn k gk
nn j gj
ino <Home> <C-O>g0
ino <End> <C-O>g$
ino <Up> <C-O>gk
ino <Down> <C-O>gj
xn 0 g0
xn ^ g^
xn $ g$
xn k gk
xn j gj

if empty(glob('~/.config/nvim/autoload/plug.vim'))
        !curl --create-dirs -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
en

cal plug#begin('~/.config/nvim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'morhetz/gruvbox'
cal plug#end()

se bg=dark
let g:gruvbox_italic=1
sil! colo gruvbox
sy enable
