" <https://github.com/vim/vim/blob/master/runtime/syntax/tex.vim#L603>
syn region texZone start="\\begin{minted}{\([^{}\\]\|\\.\)*}" end="\\end{minted}\|%stopzone\>"

if b:tex_stylish
        syn region texZone start="\\mint\(inline\)\={\([^{}\\]\|\\.\)*}\z([^\ta-zA-Z@]\)" end="\z1\|%stopzone\>"
else
        syn region texZone start="\\mint\(inline\)\={\([^{}\\]\|\\.\)*}\z([^\ta-zA-Z]\)" end="\z1\|%stopzone\>"
endif
