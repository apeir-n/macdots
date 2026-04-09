"plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'mhinz/vim-startify'

call plug#end()

"options
syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
"set cursorline
set notermguicolors
set mouse=a
set clipboard=unnamedplus
set fillchars=eob:\ 
set noshowmode
set noruler
set noshowcmd
set nowrap
set encoding=UTF-8

"options_cursorbehavior"""""""""""""""""""""""""
let &t_SI.="\e[5 q" "SI = insert""""""""""""""""
let &t_SR.="\e[4 q" "SR = replace"""""""""""""""
let &t_EI.="\e[2 q" "EI = normal(else)""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""  1 -> blinking block"""""""""
""""""""""""""""""  2 -> solid block""""""""""""
""""""""""""""""""  3 -> blinking underscore""""
""""""""""""""""""  4 -> solid underscore"""""""
""""""""""""""""""  5 -> blinking vertical bar""
""""""""""""""""""  6 -> solid vertical bar"""""

"options_cursorposition
augroup remember_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

"options_fixyank
noremap y "+y
noremap Y "+Y
noremap yy "+yy
vmap y "+y

"config_nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"config_buftabline
set hidden
nnoremap L :bnext<CR>
nnoremap H :bprev<CR>
let g:buftabline_numbers = 2
let g:buftabline_show = 1

"config_highlightedyank
let g:highlightedyank_highlight_duration = 150

"config_lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ }
"wombat, solarized, powerline, powerlineish,
"jellybeans, molokai, seoul256, darcula, selenized_dark,
"selenized_black, selenized_light, selenized_white,
"Tomorrow, Tomorrow_Night, Tomorrow_Night_Blue,
"Tomorrow_Night_Bright, Tomorrow_Night_Eighties, PaperColor,
"landscape, one, materia, material, OldHope, nord, deus,
"simpleblack, srcery_drk, ayu_mirage, ayu_light, ayu_dark,
"apprentice, rosepine, rosepine_moon, 16color

"config_whichkey
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <leader> :<c-u>WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '<localleader>'<CR>
let g:which_key_map = {
    \ 'e': [':e ~/.vimrc', 'editvimrc'],
    \ 'r': [':so ~/.vimrc', 'reloadvimrc'],
    \ 'n': [':NERDTreeToggle', 'nerdtree'],
    \ 'f': [':NERDTreeFind', 'findfile'],
    \ 'h': [':bnext', 'rightbuf'],
    \ 'l': [':bprev', 'leftbuf'],
\ }
let g:which_key_sep = '➜'
autocmd VimEnter * call timer_start(100, { -> which_key#register(' ', g:which_key_map) }) "delayload

"config_startify
let g:startify_custom_header = [
    \ '     ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                    ',
    \ '     ⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣦⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                    ',
    \ '     ⠀⠀⠀⠀⠀⠀⢿⣿⠟⠋⠉⠀⠀⠀⠀⠉⠑⠢⣄⡀⠀⠀⠀⠀⠀                                    ',
    \ '     ⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣦⡀    o8   o88                        ',
    \ '     ⠀⣀⠀⠀⢀⡏⠀⢀⣴⣶⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠇  o888oo oooo  oo oooooo oooo   oooo',
    \ '     ⣾⣿⣿⣦⣼⡀⠀⢺⣿⣿⡿⠃⠀⠀⠀⠀⣠⣤⣄⠀⠀⠈⡿⠋⠀   888    888   888   888 888   888 ',
    \ '     ⢿⣿⣿⣿⣿⣇⠀⠤⠌⠁⠀⡀⢲⡶⠄⢸⣏⣿⣿⠀⠀⠀⡇⠀⠀   888    888   888   888  888 888  ',
    \ '     ⠈⢿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠈⠉⠓⠂⠀⠙⠛⠛⠠⠀⡸⠁⠀⠀    888o o888o o888o o888o   8888   ',
    \ '     ⠀⠀⠻⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⠀⠀⠀⠀⠑⠀⣠⠞⠁⠀⠀⠀                          o8o888    ',
    \ '     ⠀⠀⠀⢸⡏⠉⠛⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀               o88                   ',
    \ '     ⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢿⣿⣿⣿⣿⡄⠀⠀⠀   oooo   oooo oooo  oo ooo oooo     ',
    \ '     ⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⡀⠀⠀    888   888   888   888 888 888    ',
    \ '     ⠀⠀⠀⢸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀     888 888    888   888 888 888    ',
    \ '     ⠀⠀⠀⢸⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡟⠻⠿⠟⠀⠀⠀       888     o888o o888o888o888o   ',
    \ '     ⠀⠀⠀⠀⣿⣿⣿⣿⣶⠶⠤⠤⢤⣶⣾⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀                                    ',
    \ '     ⠀⠀⠀⠀⠹⣿⣿⣿⠏⠀⠀⠀⠈⢿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀                                    ',
    \ '     ⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀                                    ',
\]

let g:startify_lists = [
    \ { 'type': 'commands',  'header': ['   Welcome, Russybear 🍼💻'] },
\ ]

let g:startify_commands = [
    \ { 'n': ['new', ':ene'] },
    \ { 'e': ['files', ':NERDTreeToggle'] },
    \ { 'f': ['find', ':NERDTreeFind'] },
    \ { 'v': ['edit', ':e ~/.vimrc'] },
    \ { 'r': ['reload', ':so ~/.vimrc'] },
    \ { 'c': ['colors', ':colorscheme'] },
    \ { 'q': ['quit', ':q'] },
\ ]
