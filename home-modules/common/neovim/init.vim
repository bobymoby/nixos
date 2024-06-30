language en_US.utf-8

set nu

let g:mapleader = ','

nnoremap ; :
xnoremap ; :

"exit insert mode
imap jk <ESC>
imap kj <ESC>

" Ctrl-/ toggle comment
vnoremap <C-_> <Plug>Commentary
nnoremap <C-_> <Plug>CommentaryLine

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)

"Ctrl-BS"
inoremap <C-H> <C-W>

"Spell checking <F11>
nnoremap <silent> <F11> :<C-U>set spell!<cr>
inoremap <silent> <F11> <C-O>:<C-U>set spell!<cr>

nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

" nnoremap <silent> <leader>n :NERDTreeCWD<CR>
nnoremap <silent> <C-B> :silent NERDTreeMirror<CR>:NERDTreeToggle<CR>

nnoremap <silent> <leader>ft :Telescope<CR>
nnoremap <silent> <leader>ff :Telescope find_files<CR>
