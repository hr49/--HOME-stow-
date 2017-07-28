setlocal spell

setlocal tabstop=2

" ``When zero the 'ts' value will be used'' (:h 'shiftwidth').
setlocal shiftwidth=0

function! Format()
        " ``This example shows using the functions to save and restore a
        " register'' (:h setreg()).
        let var_a = getreg('a', 1, 1)
        let var_amode = getregtype('a')

        try
                normal ma
                ?\(\(\n\)\@<=$\|\(%\n\)\@<=---%$\)
                normal jVNkgq`a
        finally
                call setreg('a', var_a, var_amode)
        endtry
endfunction

nnoremap <C-J> :call Format()<CR>
inoremap <C-J> <Esc>:call Format()<CR>a

nnoremap <Leader>i i\textit{<Esc>ea}<Esc>
