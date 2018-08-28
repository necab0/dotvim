execute pathogen#infect()
filetype plugin indent on

set modeline
set modelines=5

set encoding=utf-8
set relativenumber
set number
set expandtab
set tabstop=4
set shiftwidth=4

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

"mouse
set mouse=a
set mousemodel=extend
set clipboard=unnamedplus

set background=dark
colorscheme PaperColor
:highlight Directory guifg=#FF0000 ctermfg=red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:match ExtraWhitespace /\s\+$/

let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_extensions = ['tag']

noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>

" fzf bindings
noremap <F4> :FZF<CR>
inoremap <F4> <esc>:w<CR>:FZF<CR>

" launch current file
nnoremap <F5> :!%:p<CR>

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" rustfmt on save
let g:rustfmt_autosave = 1

let mapleader = ","

noremap <leader>ev :vsp $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" buffer management
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
noremap <leader>w :bd<CR>

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

" clear search highlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
    " redraw!
endfunction

