setlocal tabstop=2

" ``When zero the 'ts' value will be used'' (:h 'shiftwidth').
setlocal shiftwidth=0

setlocal cinoptions=:0,l1,g0,N-s,+2s,(0,W4
setlocal cindent

nnoremap <C-J> :pyfile /usr/share/vim/addons/syntax/clang-format.py<CR>
inoremap <C-J> <C-O>:pyfile /usr/share/vim/addons/syntax/clang-format.py<CR>
xnoremap <C-J> :pyfile /usr/share/vim/addons/syntax/clang-format.py<CR>
