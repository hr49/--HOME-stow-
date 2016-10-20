setl nowrap nolbr nobri

setl tw=80
setl fo=croq

setl sw=2
setl cino=L0,l1,+2s,(0,W4,j1
setl cin

setl ts=2

ino <C-Z> <C-O>:exe "norm" &tw - col(".") . "a-"<CR>

fu! S_foldtext()
        retu substitute(getline(v:foldstart),'^\(\%(  \)*\)\/\/ <editor-fold defaultstate="collapsed" desc="\([^"]*\)">$','+  \1\2 ', '')
endf

setl fdt=S_foldtext()
setl fmr=<editor-fold\ ,</editor-fold>

nm <C-Q>1 m'O// <lt>editor-fold defaultstate="collapsed" desc="public"><Esc>jo// <lt>/editor-fold><Esc>''
im <C-Q>1 <Esc>O// <lt>editor-fold defaultstate="collapsed" desc="public"><Esc>jo// <lt>/editor-fold><Esc>kA
xm <C-Q>1 <Esc>'<V'>c// <lt>editor-fold defaultstate="collapsed" desc="public"><CR><lt>/editor-fold><Esc>P
nm <C-Q>2 m'O// <lt>editor-fold defaultstate="collapsed" desc="protected"><Esc>jo// <lt>/editor-fold><Esc>''
im <C-Q>2 <Esc>O// <lt>editor-fold defaultstate="collapsed" desc="protected"><Esc>jo// <lt>/editor-fold><Esc>kA
xm <C-Q>2 <Esc>'<V'>c// <lt>editor-fold defaultstate="collapsed" desc="protected"><CR><lt>/editor-fold><Esc>P
nm <C-Q>3 m'O// <lt>editor-fold defaultstate="collapsed" desc="private"><Esc>jo// <lt>/editor-fold><Esc>''
im <C-Q>3 <Esc>O// <lt>editor-fold defaultstate="collapsed" desc="private"><Esc>jo// <lt>/editor-fold><Esc>kA
xm <C-Q>3 <Esc>'<V'>c// <lt>editor-fold defaultstate="collapsed" desc="private"><CR><lt>/editor-fold><Esc>P
