syntax enable
 
filetype plugin indent on
 
colorscheme kolor
 
set history=700 " Sets how many lines of history VIM has to remember
 
 
set autoread " Set to auto read when a file is changed from the outside
 
set wildmenu " Turn on the WiLd menu
 
set incsearch " search act like search in modern browsers
 
set smartcase " try to be smart about cases
 
set magic " For regular expressions turn magic on
 
 set expandtab " Use spaces instead of tabs
 
set smarttab " Be smart when using tabs
 
set shiftwidth=2 " Indents will have a width of 4
 
set tabstop=2
 
"set softtabstop=2 " Sets the number of columns for a TAB
 
" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,nbsp:~,eol:¬
 
set hlsearch " Highlight search results
 
set ai " Auto indent
 
set si " Smart indent
 
set number " line Numbers
 
set mouse=a " Mouse support
 
call pathogen#infect()
 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
 
 
 
" Run Shell commands:
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
 
" Alias
ca shell Shell
