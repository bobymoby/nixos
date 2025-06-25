colorscheme dracula

let g:mapleader = ','

set background=dark
set termguicolors
set number
set relativenumber
set cursorline
set showcmd
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap
set scrolloff=8
set sidescrolloff=8
set mouse=a
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set updatetime=300
set timeoutlen=500
set undofile
set undodir=~/.local/share/nvim/undodir
set backup
set backupdir=~/.local/share/nvim/backup
set writebackup
set swapfile
set directory=~/.local/share/nvim/swap
set foldmethod=syntax
set foldlevelstart=99
set foldenable
set laststatus=2
set showtabline=2
set splitbelow
set splitright
set list
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:␣
set formatoptions+=croql
set whichwrap+=<,>,h,l,[,],b,s
set sessionoptions+=globals

nnoremap ; :
xnoremap ; :

imap jk <ESC>
imap kj <ESC>

" Ctrl-backspace
inoremap <C-H> <C-W>

nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

nnoremap <silent> <C-B> :silent NERDTreeMirror<CR>:NERDTreeToggle<CR>

nnoremap <silent> <leader>ft :Telescope<CR>
nnoremap <silent> <leader>ff :Telescope find_files<CR>