execute pathogen#infect()
filetype plugin indent on

set title

set modeline
set modelines=5

set encoding=utf-8
set relativenumber
set number
set expandtab
set tabstop=4
set shiftwidth=4

" swap files
set directory^=$HOME/.vim/swp//

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

"mouse
set mouse=a
set mousemodel=extend
set clipboard=unnamedplus

:highlight Directory guifg=#FF0000 ctermfg=red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:match ExtraWhitespace /\s\+$/

" toggle nerd tree
noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>

" fzf bindings
noremap <F4> :FZF<CR>
inoremap <F4> <esc>:w<CR>:FZF<CR>

" launch current file
nnoremap <F5> :!%:p<CR>

let mapleader = ","

noremap <leader>ev :vsp $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" buffer management
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
noremap <leader>w :bd<CR>

" clear search highlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nmap <Leader>pp :RunSilent xdg-open /tmp/vim-pandoc-out.pdf &<CR>

" trim trailing whitespace
autocmd BufWritePre *.py :%s/\s+$//e
"

" https://github.com/kien/ctrlp.vim configuration
let g:ctrlp_extensions = ['tag']

" https://github.com/vim-airline/vim-airline configuration
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" https://github.com/vim-airline/vim-airline-themes configuration
let g:airline_theme='dark'
set background=dark
colorscheme PaperColor

" https://github.com/SirVer/ultisnips configuration
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" https://github.com/Valloric/YouCompleteMe configuration
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" https://github.com/rust-lang/rust.vim.git configuration
let g:rustfmt_autosave = 1

" https://github.com/Xuyuanp/nerdtree-git-plugin configuration
let g:NERDTreeShowIgnoredStatus = 1

