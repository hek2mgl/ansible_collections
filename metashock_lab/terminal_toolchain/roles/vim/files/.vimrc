set et
set ts=4
set sw=4
set number

nnoremap ö :set number!<CR>
nnoremap ä :set list!<CR>

autocmd FileType make setlocal noexpandtab softtabstop=0
autocmd FileType yaml setlocal sw=2 ts=2
autocmd FileType json setlocal sw=2 ts=2

" From: https://stackoverflow.com/a/17936413/171318
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=~/.vim/undo  "directory where the undo files will be stored
endif

" From: https://stackoverflow.com/a/14449484/171318
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
