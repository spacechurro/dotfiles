" pathogen bundles
"
" https://github.com/scrooloose/syntastic.git
" git://github.com/tpope/vim-endwise.git
" git://github.com/tpope/vim-rails.git
" git://github.com/slim-template/vim-slim.git
" https://github.com/groenewege/vim-less
" https://github.com/wincent/terminus.git
" git://github.com/tpope/vim-fugitive.git
" https://github.com/pangloss/vim-javascript.git
" https://github.com/vim-airline/vim-airline
" https://github.com/lifepillar/pgsql.vim.git

execute pathogen#infect()
syntax enable
filetype plugin indent on

set background=dark
set scrolloff=3 " start scrolling when cursor is x lines away from top/bottom
set history=1000

au BufReadPost *.rake set syntax=ruby
au BufReadPost *.spec set syntax=ruby
au BufReadPost .irbrc set syntax=ruby
au BufReadPost Gemfile set syntax=ruby
au BufReadPost config.ru set syntax=ruby
au BufReadPost *.scss set filetype=css

set wildmenu
set wildmode=list:longest

set tabstop=2 " x space tab width
set autoindent " copy indentation from previous line
set smartindent " indent more based on previous line
set shiftwidth=2 " spaces to indent when auto indenting
set expandtab " use spaces when indenting

set ignorecase " ignore case when searching
set smartcase " override ignorecase when capitals are present
set backspace=2 " allows backspacing over line breaks, autoindents, and the start of insert.  needed from 7.0 to 7.2 upgrade

set tags^=./.git/tags;

"set foldmethod=syntax
au BufReadPost .git/COMMIT_EDITMSG set nofoldenable " don't fold git commits

" remap movement for wrapped lines to go up one screen line as opposed to one line of text
map <DOWN> gj
map <UP> gk
imap <DOWN> <ESC>gja
imap <UP> <ESC>gka

set hlsearch " highlight search results

" FIXME: Ghetto! get number pad working w/ iterm  
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <Esc>Ol +
map! <Esc>OS -

" nicer highlighting of search results
highlight Search ctermbg=yellow ctermfg=blue cterm=bold

" prettier diff hilighting
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

function! FormatXML()
  silent 1,$s/\n//g
  silent 1,$!xmllint --format --recover - 2>/dev/null
endfunction

function! FormatSQL()
  silent 1,$!pg_format -
endfunction

function! FormatJSON()
  silent 1,$s/\n//g
  silent 1,$!python3 -m json.tool
endfunction


" https://github.com/garybernhardt/selecta
"
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
