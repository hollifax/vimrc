if has ('autocmd') " Remain compatible with earlier versions
	augroup vimrc     " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
	augroup END
endif " has autocmd:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/auto-pairs-gentle'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'benmills/vimux'


cal vundle#end()
filetype plugin indent on

set autoread
set cursorline
set visualbell
set number
set wildmode=longest:list,full
set showmatch
set hlsearch
set ignorecase
set smartcase
set smartindent
set nowrap
set scrolloff=5
set sidescrolloff=7
set sidescroll=1
set splitright
set splitbelow
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab
set list
set listchars=tab:→⋅

let g:SeeTablEnabled=1

" Command mode binds
nnoremap <silent> <C-J> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-K> :TmuxNavigateDown<cr>
nnoremap <silent> <C-L> :TmuxNavigateUp<cr>
nnoremap <silent> <C-H> :TmuxNavigatePrevious<cr>
nnoremap <silent> vv <C-w>v
nnoremap <silent> VV <C-w>s
nnoremap <silent> <S-tab> <<

" Insert mode binds
inoremap <silent> <S-tab> <C-d>

" Force sudo for write-protected (will require password)
cnoremap w!! w !sudo tee > /dev/null %

" Highlight status bar so horizontal splits aren't painful
highlight StatusLine ctermfg=Blue ctermbg=White
highlight StatusLineNC ctermfg=Blue ctermbg=White


execute pathogen#infect()
au BufRead,BufNewFile *.ts setfiletype typescript

" Prompt command
map <Leader>$ :VimuxPromptCommand<CR>
map <Leader>$r :VimuxRunLastCommand<CR>
map <Leader>$z :VimuxZoomRunner<CR>
map <Leader>$c :VimuxInspectRunner<CR>
