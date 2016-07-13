se enc=utf-8

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
se bs=indent,eol,start
se et
let g:netrw_liststyle = 3
se nowmnu
se wim=list:longest
se hi=10000
se is
se hls
se nosmd

aug hr
        au!
        au FileType cpp,java ino <C-Z> <C-O>:exe "norm" &tw - col(".") . "a-\<lt>Esc>"<CR>
aug end

se fdm=marker

aug java_access_mode
        au!
        au FileType java nm <C-Q>1 m'O// public: {{{ <lt>editor-fold defaultstate="collapsed" desc="public:"><Esc>jo// }}} <lt>/editor-fold><Esc>''
        au FileType java im <C-Q>1 <Esc>O// public: {{{ <lt>editor-fold defaultstate="collapsed" desc="public:"><Esc>jo// }}} <lt>/editor-fold><Esc>kA
        au FileType java xm <C-Q>1 <Esc>'<V'>c// public: {{{ <lt>editor-fold defaultstate="collapsed" desc="public:"><CR>}}} <lt>/editor-fold><Esc>P
        au FileType java nm <C-Q>2 m'O// protected: {{{ <lt>editor-fold defaultstate="collapsed" desc="protected:"><Esc>jo// }}} <lt>/editor-fold><Esc>''
        au FileType java im <C-Q>2 <Esc>O// protected: {{{ <lt>editor-fold defaultstate="collapsed" desc="protected:"><Esc>jo// }}} <lt>/editor-fold><Esc>kA
        au FileType java xm <C-Q>2 <Esc>'<V'>c// protected: {{{ <lt>editor-fold defaultstate="collapsed" desc="protected:"><CR>}}} <lt>/editor-fold><Esc>P
        au FileType java nm <C-Q>3 m'O// private: {{{ <lt>editor-fold defaultstate="collapsed" desc="private:"><Esc>jo// }}} <lt>/editor-fold><Esc>''
        au FileType java im <C-Q>3 <Esc>O// private: {{{ <lt>editor-fold defaultstate="collapsed" desc="private:"><Esc>jo// }}} <lt>/editor-fold><Esc>kA
        au FileType java xm <C-Q>3 <Esc>'<V'>c// private: {{{ <lt>editor-fold defaultstate="collapsed" desc="private:"><CR>}}} <lt>/editor-fold><Esc>P
aug end

se wrap lbr bri
nn 0 g0
nn g0 0
nn ^ g^
nn g^ ^
nn $ g$
nn g$ $
nn k gk
nn gk k
nn j gj
nn gj j
ino <Home> <C-O>g0
ino <End> <C-O>g$
ino <Up> <C-O>gk
ino <Down> <C-O>gj
xn 0 g0
xn g0 0
xn ^ g^
xn g^ ^
xn $ g$
xn g$ $
xn k gk
xn gk k
xn j gj
xn gj j

se so=3

aug ClangFormat
        au!
        au FileType cpp,java nn <C-P> m'O// clang-format off<Esc>jo// clang-format on<Esc>''
        au FileType cpp,java ino <C-P> <Esc>O// clang-format off<Esc>jo// clang-format on<Esc>kA
        au FileType cpp,java xn <C-P> <Esc>'<V'>c// clang-format off<CR>clang-format on<Esc>P
        au FileType cpp,java nn <C-N> m'O// clang-format on<Esc>jo// clang-format off<Esc>''
        au FileType cpp,java ino <C-N> <Esc>O// clang-format on<Esc>jo// clang-format off<Esc>kA
        au FileType cpp,java xn <C-N> <Esc>'<V'>c// clang-format on<CR>clang-format off<Esc>P
        au FileType cpp,java nn <C-J> :pyf /home/matthew/clang+llvm-3.8.0-x86_64-linux-gnu-debian8/share/clang/clang-format.py<CR>
        au FileType cpp,java ino <C-J> <C-O>:pyf /home/matthew/clang+llvm-3.8.0-x86_64-linux-gnu-debian8/share/clang/clang-format.py<CR>
        au FileType cpp,java xn <C-J> :pyf /home/matthew/clang+llvm-3.8.0-x86_64-linux-gnu-debian8/share/clang/clang-format.py<CR>
aug end

let g:EclimCompletionMethod = 'omnifunc'

if empty(glob('~/.vim/autoload/plug.vim'))
        sil !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
en

cal plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jeaye/color_coded', { 'do': 'cmake . && make && make install' }
Plug 'Valloric/YouCompleteMe', { 'do': 'PATH=\"/sbin:${PATH}\" ./install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
cal plug#end()

se bg=dark
sil! colo gruvbox
se go=M
sy enable

let g:ycm_python_binary_path = '/usr/bin/python2.7'
