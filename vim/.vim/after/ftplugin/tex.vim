setlocal spell

setlocal tabstop=2

" ``When zero the 'ts' value will be used."
setlocal shiftwidth=0

inoremap <S-Tab> <Space><BS><Esc>m`<<``a

nnoremap <C-J> ma{V}gq`a
inoremap <C-J> <Esc>ma{V}gq`aa

nnoremap <C-J> ma{V}gq`a
inoremap <C-J> <Esc>ma{V}gq`aa

nnoremap <Leader>i i\textit{<Esc>ea}<Esc>
