"
" ########            ########
" ######## CHEATSHEET ########
" ########            ########
"
" (also check: http://i.imgur.com/YLInLlY.png)
"
" Tips and info:
" -- check vim's default key mappings:
" ++ :help index
"
" -- check where each mapping was defined:
" ++ :verbose map {<mapping>}
"
" -- move to start of indentation (i.e. first non-blank char of line)
" ++ ^
" ++ <leader>0             " mapped it
" ++ _
" ++ +                     " moves to next line's first non-blank char
" ++ -                     " moves to previous line's first non-blank char
"
" -- jump to tags and back etc
" ++ ctrl-]                " to tag under cursor
" ++ ctrl-o                " back to previous location
" ++ ctrl-t                " forward to next location in the jump list
" ++ gF                    " to file under cursor (if the filename is followed
"                          " by a line number jump to the specific line)
"
" -- objects (used in visual mode, folds, yank with movement etc):
"    (from :help visual-operators)
" ++ aw/iw    a word (with/without white space)
" ++ aW/iW    a WORD (with/without white space)
" ++ as/is    a sentence (with/without white space)
" ++ ap/ip    a paragraph (with/without white space)
" ++ ab/ib    a () block (with/without parentheses)
" ++ aB/iB    a {} block (with/without braces)
" ++ at/it    a <tag> </tag> block (with/without tags)
" ++ a</i<    a <> block (with/without <>)
" ++ a[/i[    a [] block (with/without [])
" ++ a"/i"    a double quoted string (with/without quotes)
" ++ a'/i'    a simple quoted string (with/without quotes)
" ++ a`/i`    a string in backticks (with/without backticks)
"
" -- in visual mode:          (from :help visual-operators)
" ++ U/u      make selection uppercase/lowercase
" ++ ~        switch case of selection
"
" -- insert output of external command (e.g. git grep) in buffer:
" ++ :tabedit                 (optional)
" ++ :r !git grep -n something
"
" -- folding navigation:
" ++ zv      open just enough folds to show the line the cursor is on
" ++ zA      on closed fold: open it recursively  (don't use it on open fold)
" ++ zx      like zv but also close non-relevant folds  (and recompute folds)
"
" -- in visual mode (having selected some text) a single 'o' moves you between
" beginning and end of the selection
"
" -- scroll viewport (while holding the cursor on the same line)
" ++ ctrl-y       " see up
" ++ ctrl-e       " see down
"
" -- check if the current file was changed outside vim (use with autoread)
" ++ :checktime


"
" ########              ########
" ######## MY VARIABLES ########
" ########              ########
"
" -- g:open_nerd_tree
" ++ if it exists when starting vim, we'll open the nerd tree window



"
" ########         ########
" ######## GENERAL ########
" ########         ########
"
" don't emulate the original vi's bugs and limitations:
set nocompatible
" enable syntax highlighting
syntax on




"
" ########        ########
" ######## VUNDLE ########
" ########        ########
"
" required to turn filetype detection off for the duration of vundle setup
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')


" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" Stop foldmethod=syntax (et al.) from bogging down your vim.
" Folds are only recomputed on buffer save (and some other cases)
" and foldmethod manual is used the rest of the time.
Plugin 'Konfekt/FastFold'

" Syntax file for JavaScript libraries. (jQuery etc)
" Plugin 'othree/javascript-libraries-syntax.vim'

" Enhanced javascript syntax file.
Plugin 'jelera/vim-javascript-syntax'

" Better file/directory browser.
" Plugin 'scrooloose/nerdtree'

" Use vim as a python ide.
" (I also have it disabled via its settings)
" (this is said to conflict with jedi-vim and other stuff)
" Plugin 'klen/python-mode'

" Improved syntax highlighting for rspec.
Plugin 'keith/rspec.vim'

" Switch between single and multi-line statements with gS/gJ.
" Plugin 'AndrewRadev/splitjoin.vim'

" Syntax checking through external syntax checkers.
Plugin 'scrooloose/syntastic'

" Align text using `:Tabularize /<delimiter>`
Plugin 'godlygeek/tabular'

" Add various text objects to have more targets to operate on.
" Plugin 'wellle/targets.vim'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plugin 'vim-airline/vim-airline-themes'

" CoffeeScript support for vim (syntax, indenting, compiling and more).
Plugin 'kchmck/vim-coffee-script'

" Precision colorscheme (solarized).
Plugin 'altercation/vim-colors-solarized'

" Comment stuff out using gcc/gc
Plugin 'tpope/vim-commentary'

" Visually select increasingly larger regions (using v).
" Plugin 'terryma/vim-expand-region'

" A git wrapper so awesome it should be illegal.
Plugin 'tpope/vim-fugitive'

" Syntax highlighting, matching rules and mappings for Markdown.
Plugin 'plasticboy/vim-markdown'

" Miscellaneous auto-load Vim scripts (required by vim-session).
Plugin 'xolox/vim-misc'

" Vim/Ruby Configuration Files.
" (completion seems to work even without this and vim-rails)
" (takes care of syntax highlighting for erb files, among other things)
Plugin 'vim-ruby/vim-ruby'

" Ruby on Rails power tools.
Plugin 'tpope/vim-rails'

" Extended session management (:mksession on steroids).
Plugin 'xolox/vim-session'

" Command-T is a Vim plug-in that provides an extremely fast "fuzzy" mechanism for:
"   Opening files and buffers
"   Jumping to tags and help
"   Running commands, or previous searches and commands
" with a minimal number of keystrokes.
" Plugin 'wincent/command-t'
" TODO: re-add this

" All aboud "surroundings": parentheses, brackets, quotes, XML tags, and more.
" - cs<old_surrounding><new_surrounding> to change surrounding
" - ds<surrounding> to delete the surrounding
" - ys<text_object><surrounding> to add surrounding to text object
" - S<surrounding> in visual mode
" - surroundings: " ' ( ) [ ] { } <q> <em> <some_tag attr='val> ...
Plugin 'tpope/vim-surround'

" Make `.` work for tpope plugins (surround, unimpaired, commentary, and more).
Plugin 'tpope/vim-repeat'

" Text objects for entire buffer ie/ae.
" Plugin 'kana/vim-textobj-entire'

" Text objects for indented blocks of lines.
" Plugin 'kana/vim-textobj-indent'

" Text objects for the current line.
" Plugin 'kana/vim-textobj-line'

" Text object for ruby blocks.
" Plugin 'nelstrom/vim-textobj-rubyblock'

" Create your own text objects (required by other plugins).
" Plugin 'kana/vim-textobj-user'

" Seamless navigation between tmux panes and vim splits.
Plugin 'christoomey/vim-tmux-navigator'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plugin 'ctrlpvim/ctrlp.vim'

" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-endwise'

" Configure tab labels within Terminal Vim with a very succinct output.
Plugin 'mkitt/tabline.vim'

" Display the indention levels with thin vertical lines.
" Plugin 'Yggdroot/indentLine'

" Automatically opens popup menu for completions.
" Plugin 'vim-scripts/AutoComplPop'

" Perform all your vim insert mode completions with Tab.
Plugin 'ervandew/supertab'

" Using the jedi (python) autocompletion library for VIM.
" - will show function params as you type
" - seems that it works with supertab (even for function params)
" - K (in normal mode) will pop up documentation for a function or class
" - `:Pyimport <module>` opens the <module> module
" - completes stuff with <c-space> (configurable) - but no need since it
"   works with <tab> as well
Plugin 'davidhalter/jedi-vim'

" Start a * or # search from a visual block
" (select some text using Vim's visual mode and then hit * and # to search
" for it elsewhere in the file)
Plugin 'nelstrom/vim-visual-star-search'

" Toggles between relative and absolute line numbers automatically
"   <c-n> to toggle between relative and absolute numbers
"   `let g:UseNumberToggleTrigger=0` if you want to disable the toggle shortcut
"   `let g:NumberToggleTrigger="..."` to change the trigger to ...
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
let g:UseNumberToggleTrigger=0

" A Vim plugin for indent-level based motion
"   [- : Move to previous line of lesser indent than the current line.
"   [+ : Move to previous line of greater indent than the current line.
"   [= : Move to previous line of same indent as the current line that is
"        separated from the current line by lines of different indents.
"   ]- : Move to next line of lesser indent than the current line.
"   ]+ : Move to next line of greater indent than the current line.
"   ]= : Move to next line of same indent as the current line that is separated
"        from the current line by lines of different indents.
Plugin 'jeetsukumaran/vim-indentwise'

" Use <c-a>/<c-x> to increment dates, times, and more
Plugin 'tpope/vim-speeddating'

" Vim plugin that defines a new text object representing lines of code
" at the same indent level.
Plugin 'michaeljsmith/vim-indent-object'

" This plugin provides a text-object 'a' (argument).
" You can d(elete), c(hange), v(select)... an argument or inner argument
" in familiar ways.
" That is, such as 'daa'(delete-an-argument) 'cia'(change-inner-argument)
" 'via'(select-inner-argument).
Plugin 'vim-scripts/argtextobj.vim'

" A vim script to provide CamelCase motion through words
"   I'll use `,w` `,e` `,ge` `,b` to move across CamelCase/snake_case words
"   `i,w` `i,e` `i,ge` `i,b` will be the text objects
Plugin 'bkad/CamelCaseMotion'

" Replace text with the contents of a register
"   [count]["x]gr{motion} Replace {motion} text with the contents of register x.
"   [count]["x]grr        Replace [count] lines with the contents of register x.
"   {Visual}["x]gr        Replace the selection with the contents of register x.
Plugin 'vim-scripts/ReplaceWithRegister'

" Ranger integration in vim and neovim
"   use `:Ranger` to open ranger in the current file's directory
"   use `:RangerWorkingDirectory` to open ranger in the current workspace
"     (current workspace is the directory vim is currently `cd`ed into)
Plugin 'francoiscabrol/ranger.vim'


" all plugins must be added before the following line (required)
call vundle#end()
"
" done with vundle setup - reenable filetype indent & plugin
filetype indent on
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal


"
" ########                     ########
" ######## ALT INPUT LANGUAGES ########
" ########                     ########
"
" toggle input language between greek and english
command! ToggleInputLang if &keymap=="" |
                       \   let &keymap="greek_utf-8" |
                       \ else |
                       \   let &keymap="" |
                       \ endif

" print input language (english or greek?)
command! PrintInputLang if &keymap=="" |
                      \   echo "lang=english" |
                      \ else |
                      \   echo "lang=greek" |
                      \ endif

"
" ########                     ########
" ######## New, Uncategorized  ########
" ########                     ########
"
" always show line numbers
"   when used in combination with relativenumber, it replaces 0
"   in the current line with the actual line number
set number
" show relative numbers
set relativenumber
" make every wrapped line continue visually indented
set breakindent

"
" ########           ########
" ######## Timeouts  ########
" ########           ########
"
" time out on :mappings and key codes?
set notimeout
" time out on mappings after x milliseconds
" (only makes sense when timeout is set)
"set timeoutlen=4000

" time out when waiting on key codes?
set ttimeout
" time out on key codes (e.g. `<esc>...` in insert mode) after x milliseconds
set ttimeoutlen=0

" make escape be recognized automatically (if noesckeys)
" + otherwise it waits in case it's being used as a modifier key
" + instead of resetting this option, you might want to
"   try changing the values for 'timeoutlen' and 'ttimeoutlen'
"set noesckeys



"
" ########                     ########
" ######## New, Uncategorized  ########
" ########                     ########
"
" make copy and paste (outside vim) play well with vim's yank, paste etc
set clipboard=unnamed

" make '§' the <leader> key
" (workaround because space won't show up in the showcmd window)
let mapleader = '§'
" but space will be the actual <leader>
nmap <space> <leader>
vmap <space> <leader>

" when (de)indenting don't lose selection after moving block
vnoremap < <gv
vnoremap > >gv

" allow edited buffers that are only visible in the buffer list
" (also allows vim to keep a buffer open even after the window is closed)
set hidden

" toggle background
command! ToggleBackground if &background=='dark' |
                        \   let &background="light" |
                        \ else |
                        \   let &background="dark" |
                        \ endif

" star-search for non-exact match
nnoremap <leader>* g*
nnoremap <leader>8 g*

" list all buffers and get ready to switch to one of them
nnoremap <leader>b :ls<cr>:b
nnoremap <leader>v :CtrlPBuffer<cr>

" if a file has been detected to be changed outside vim reread it
" (throws an error if the file was deleted outside vim)
" (use :checktime to see if the file was changed outside vim)
"set autoread

" open file under cursor in new tab
nnoremap <leader>gf <c-w>gf
vnoremap <leader>gf <c-w>gf

" open command-edit window
nnoremap q; q:

" exit command-edit (or any other) window quickly
" nnoremap ;q :q<cr>

" search for start of diff (i.e. '<<<<<<<')
" TODO: make this find the next match if current search pattern is '<<<<<<<'
nnoremap <leader>< 0/<<<<<<<<cr>zt

" search for end of diff (i.e. '>>>>>>>')
" todo: make this find the next match if current search pattern is '>>>>>>>'
nnoremap <leader>> />>>>>>><cr>

" go to tab #1, #2, ...
nnoremap <leader>1 :tabn 1<cr>
vnoremap <leader>1 :tabn 1<cr>
nnoremap <leader>2 :tabn 2<cr>
vnoremap <leader>2 :tabn 2<cr>
nnoremap <leader>3 :tabn 3<cr>
vnoremap <leader>3 :tabn 3<cr>
nnoremap <leader>4 :tabn 4<cr>
vnoremap <leader>4 :tabn 4<cr>
nnoremap <leader>5 :tabn 5<cr>
vnoremap <leader>5 :tabn 5<cr>
nnoremap <leader>6 :tabn 6<cr>
vnoremap <leader>6 :tabn 6<cr>
nnoremap <leader>7 :tabn 7<cr>
vnoremap <leader>7 :tabn 7<cr>
" don't add a shortcut for tab 8 & 9 since we use <leader>8 for g*

" jump to 1st open window with buffer when switching buffers
set switchbuf=useopen,usetab

" TAB in insert mode autocompletes when in the middle of a word
" inoremap <expr> <tab> SmartInsertTab()
" function! SmartInsertTab()
"   if PreviousCharIsWhitespaceOrStartLine()
"     " return a tab character (respects expandtab etc)
"     return "\<tab>"
"   else
"     " open completion window and cycle through options
"     " (alternatively, "\<c-x>\<c-n>" will insert the completion and move on)
"     return "\<c-n>"
"   endif
" endfunction

" function! PreviousCharIsWhitespaceOrStartLine()
"   " =~# is always-case-sensitive regexp match
"   " (avoid =~ because it depends on 'ignorecase')
"   if GetPreviousChar() =~# '^$\|\s'
"     return 1
"   else
"     return 0
"   endif
" endfunction

" function! GetPreviousChar()
"   return matchstr(getline('.'), '\%' . (col('.') - 1) . 'c.')
" endfunction

" fix "crontab -e" error "crontab: temp file must be edited in place"
" (from: http://superuser.com/a/750528/128028)
" coupled with an alias for crontab
if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

" make sure bash aliases work when run inside vim
let $BASH_ENV="~/.bash_profile_sections/aliases.bash"

" git grep and paste results in buffer
nnoremap <leader>g :r<space>!gg<space>

" tab in normal mode indents
" nnoremap <tab> a<tab><esc>


"
" ########                             ########
" ######## Automatic Indentation & TAB ########
" ########                             ########
"
set autoindent
set smartindent      " try to guess the new line's indent level
set shiftwidth=2     " shift (with >> or <<) width = 2 spaces
set smarttab         " TAB at start of line will indent
set tabstop=2        " make TAB width = 2 spaces
set expandtab        " turn TABs into spaces
set softtabstop=2    " make spaces inserted by expandtab feel like TABs


"
" ########                ########
" ######## Searching etc. ########
" ########                ########
"
set ignorecase
set smartcase        " if there are caps, go case sensitive
set incsearch        " start searching while still typing
set showmatch        " briefly jump to matching parenthese/bracket/brace


"
" ########                 ########
" ######## Custom Commands ########
" ########                 ########
"
" -- NerdTree
"if !exists("g:user_have_set_nerdtree_shortcut_commands")
"  let g:user_have_set_nerdtree_shortcut_commands = 1
com! NO NERDTree
com! NT NERDTreeToggle
com! NN NERDTreeToggle
com! NF NERDTreeFocus
"com! NOO NERDTree | wincmd l
"endif
" -- sessions
com! -nargs=? -bang
       \ -complete=customlist,xolox#session#complete_names_with_suggestions
       \ SS SaveSession<bang> <args>
com! -nargs=? -bang -complete=customlist,xolox#session#complete_names
       \ OO OpenSession<bang> <args>
com! -nargs=? -bang -complete=customlist,xolox#session#complete_names
       \ OS OpenSession<bang> <args>
com! -nargs=? -bang CS CloseSession<bang> <args>
" -- open current file via default app:
com! OF silent execute "!open \"%\" &" | redraw!
" -- view open buffers
com! B  :ToggleBufExplorer
" -- always open help in new tab
cnoreabbrev h tab<space>help
"cnoreabbrev help tab help
" -- use CtrlP to search for buffer to edit
"cnoreabbrev e CtrlP<cr>
" -- (interactively) remove trailing whitespace
com! RemoveTrailingWhiteSpace :%s/\s\+$//c | :nohlsearch | :redraw
" -- fold html (using xml's folding rules)
com! FoldHTML :set filetype=xml | :set foldmethod=syntax | :set foldlevel=0
" -- reload .vimrc
com! Reload :source ~/.vimrc
" -- open .vimrc for editing (in new tab)
com! Config :tabe ~/.vimrc
com! RC :e ~/.vimrc

" -- close (wipeout) all hidden buffers (i.e. buffers not open in any window)
com! WipeoutHiddenBuffers :call WipeoutHiddenBuffersFunction()
com! Bdhidden :call WipeoutHiddenBuffersFunction()

" -- refresh all windows (aka panes)
com! RefreshWindows :tabdo windo edit



"
" ######## Functions  ########
"

" TODO: fix this - doesn't work as expected when there are many buffers
function! WipeoutHiddenBuffersFunction()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction



"
" ########              ########
" ######## Code Folding ########
" ########              ########
"
" -- remember:
" ++ folds must be defined by entering commands (e.g. zf)
"set foldmethod=manual
" ++ groups of lines with the same indent form a fold
"set foldmethod=indent
" ++ enable folds
"set foldenable
" ++ (fdl) display x first levels of folds
"set foldlevel=x

" -- folds are defined by syntax
set foldmethod=syntax
" -- deepest fold is x levels
set foldnestmax=8
" -- don't fold by default
set nofoldenable
" -- (un)set fillchars
set fillchars="fold: "

" -- set what text to display on a folded line
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    " --
    " original:
    "let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    "return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    " --
    " alternate 1:
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . repeat(" ",fillcharcount) . '…' . foldedlinecount . ' '
    " --
    " alternate 2:
    "let fillcharcount = windowwidth - len(line) - 3
    "let otherfillcharcount = 3 - len(foldedlinecount)
    "return line . repeat(" ",fillcharcount) . '+ ' .
    "       \ repeat(" ",otherfillcharcount) . foldedlinecount . ' '
endfunction " }}}
set foldtext=MyFoldText()

" -- is the current line folded?
function! IsFolded()
  if foldclosed(line('.')) > -1 | return 1 | else | return 0 | endif
endfunction

" -- recursively open fold and subfolds, or non-recursively close fold
com! RecursiveOpenOrNonRecursiveCloseFold silent
  \ if IsFolded() | foldo! | else | foldc | endif



"
" ########              ########
" ######## Key Mappings ########
" ########              ########
"
" -
" make my life easier
" ++ disable U (used to undo all latest changes on last changed line)
nnoremap U u
" ++ G takes you to last character of a file (not start of last line)
nnoremap G G$
vnoremap G G$
" ++ bind <leader>u to do nothing
nnoremap <leader>u <nop>
" ++ bind <leader>up to save changes
nnoremap <leader>up :up<cr>
" ++ easy force quit with error
" nnoremap <leader>q :cq!<cr>
" ++ easy save and quit
nnoremap <leader>x :x<cr>
" -
" go to start of indentation (i.e. first non-blank char of line)
nnoremap <leader>0 ^
vnoremap <leader>0 ^
" -
" toggle input language (greek/english)
inoremap <c-l> <esc>:ToggleInputLang<cr>a
"nnoremap <c-l> :ToggleInputLang<cr>:PrintInputLang<cr>
" -
" use <c-n> to clear the highlighting of :set hlsearch
nnoremap <silent> <c-n> :nohlsearch<cr>:redraw<cr>
" inoremap <silent> <c-n> <esc>:nohlsearch<cr>:redraw<cr>a
" -
" go into command mode
" noremap <leader>; :
noremap ; :
noremap : ;
" -
" toggle current fold to open/close
nnoremap <leader>a za
nnoremap <leader>A :RecursiveOpenOrNonRecursiveCloseFold<cr>
vnoremap <leader>a zf
" -
" navigate split windows easily:
" (not needed if you use vim-tmux-navigator)
" nnoremap <silent> <c-h> :wincmd<space>h<cr>
" nnoremap <silent> <c-j> :wincmd<space>j<cr>
" nnoremap <silent> <c-k> :wincmd<space>k<cr>
" nnoremap <silent> <c-l> :wincmd<space>l<cr>
" -
" navigate split windows (plus auto maximize/minimize vertically):
nnoremap <silent> <leader>j :wincmd<space>j<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>k :wincmd<space>k<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>h :wincmd<space>h<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>l :wincmd<space>l<cr>:wincmd<space>_<cr>
" nnoremap <silent> <leader>h :wincmd<space>h<cr>:wincmd<space>\|<cr>
" nnoremap <silent> <leader>l :wincmd<space>l<cr>:wincmd<space>\|<cr>
nnoremap <silent> <leader>[ :wincmd<space>p<cr>
" -
" navigate tabs
nnoremap <silent> <leader>p :tabprevious<cr>
nnoremap <silent> <leader>n :tabnext<cr>
"(remember <c-\> takes you to the previous pane
" -
" navigate buffers
nnoremap <silent> <leader>J :bnext<cr>
nnoremap <silent> <leader>K :bprevious<cr>
" -
" resize split windows easily:
nnoremap <silent> <leader>=  <c-w>=
nnoremap <silent> <leader>\ <c-w>\|
nnoremap <silent> <leader>-  <c-w>_
" -
" insert stuff from normal mode (without moving):
" empty line above
nnoremap <leader>O  mpO<esc>0D`p
" empty line below
nnoremap <leader>o  mpo<esc>0D`p
" comma after the previous word - you can just ge/gE and append what you want
"nnoremap <leader>,  mpgEa,<esc>`pl
" dot after the previous word
"nnoremap <leader>.  mpgEa.<esc>`pl
" space
"nnoremap <space>    i<space><esc>l
" tab
"nnoremap <tab>      i<tab><esc>l
" line break
"nnoremap <cr>       i<cr><esc>
" delete a character
"nnoremap <bs>       X
" -
nnoremap <leader>t  :tab
" nnoremap <leader>e  :e<space>
nnoremap <leader>e  :CommandT<cr>
nnoremap <leader>T  :wincmd<space>T<cr>
nnoremap <leader>s  :wincmd<space>s<cr>
nnoremap <leader>v  :wincmd<space>v<cr>
" -
" other:
" redo syntax highlighting
nnoremap <leader>S  :syntax sync fromstart<cr>
" -
" plugins:
" show current file's directory in NERDTree
" nnoremap <leader>f  :NERDTreeFind<cr>
" TODO: I think this conflicts with some vim-rails mapping



"
" ########       ########
" ######## Misc. ########
" ########       ########
"
set formatoptions+=w  " don't break words when wrapping lines
"set textwidth=80      " wrap text after xth column (inserts newline)
"set colorcolumn=80    " color xth column
let &colorcolumn=join(range(81,999),',')    " color from xth column onwards
" pressing <F4> while in insert mode will toggle paste-mode
" (i.e. no autoindent)
set pastetoggle=<F4>
set wildmenu          " when autocompleting commands, show menu of choices
set laststatus=2      " always show a status line (even on single window)
" when autocompleting, don't scan all included files (faster)
set complete-=i
" TODO: check if this ^ make autocompletion much slower?
" for when incrementing/decrementing numbers using CTRL-A/CTRL-X
set nrformats-=octal
" set splitbelow        " new pane opens below after split
" set splitright        " new pane opens on the right after vsplit
set ruler             " show cursor position on bottom right (e.g. 10,69)
set hls               " highlight search results (inverse: nohls)
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showcmd           " display incomplete commands
" automatically read file again if detected to have been changed outside vim
set autoread
set fileformats+=mac  " has to do with the EOL formats that will be tried
" I think this tries to keep the cursor on the same screen line when doing
" things like <Ctrl-d> and <Ctrl-u>
set display+=lastline
" set history to x entries
if &history < 100
  set history=100
endif
" in list mode ('set list' command), chars to show instead of tab etc
" set listchars=eol:¬,tab:^T
" set listchars=eol:¬,tab:^T,trail:.
" -- show trailing spaces as (differently colored) dots
set listchars=trail:.
set list
" always show at least x lines above/below the cursor
if !&scrolloff
  set scrolloff=1
endif
" always show at least x columns right/left of the cursor
if !&sidescrolloff
  set sidescrolloff=5
endif
"if has("vms")
"  set nobackup       " do not keep a backup file, use versions instead
"else
"  set backup         " keep a backup file
"endif
if has('mouse')
  set mouse=a        " enable mouse
endif
" -
" don't highlight the line the cursor is on
set nocursorline
" -
" try to make vim respond faster by reducing the amount of processing required
" (any action that is not typed will not cause the screen to redraw)
set lazyredraw
" -
" make filename completion in command line emulates bash completion:
set wildmode=longest,list
" -
" stop vim from scrolling the panes when splitting
" nnoremap <c-w>s Hmx``<space>\|:split<cr>`xzt``<c-w>k`xzt``<c-w>j
nnoremap <c-w>s Hmx``:split<cr>`xzt``<c-w>k`xzt``<c-w>j



"
" ########                       ########
" ######## Per Filetype Commands ########
" ########                       ########
"
augroup filetypespecific
  " see which autocommands are running in real-time
  "set verbose=9

  " clear all autocommands for this group
  autocmd!

  " auto reload .vimrc
  " TODO: re-add this (temporarily removed the bang)
  " autocmd! bufwritepost .vimrc source %
  autocmd bufwritepost .vimrc source %

  " -- vim help:
  autocmd FileType help setlocal nolist
  " -- vim:
  " add "-" to the list of keyword-characters
  " (makes sense for things like <c-smth> and vundle plugin names)
  autocmd FileType vim setlocal iskeyword+=-
  " -- make:
  autocmd FileType make setlocal noexpandtab
  " -- python:
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal softtabstop=4
  " autocmd FileType python inoremap <cr> <cr>x<bs>
  " autocmd FileType python nnoremap o ox<bs>
  " autocmd FileType python nnoremap O Ox<bs>
  autocmd FileType python setlocal foldcolumn=2
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal listchars=trail:.
  autocmd FileType python setlocal list
  " TEMP: TODO:
  " :FM marks folds using indent folding and then switches to manual folding
  autocmd FileType python command! -buffer FM set fdm=indent | set fen |
                                 \ %foldo! | set fdm=manual
  " TEMP: TODO:
  " press<f5> when inside a docstring to manually fold it
  autocmd FileType python nnoremap <buffer> <f5> l?"""<cr>vNzf:nohlsearch<cr>
  " mark folds and switch to manual
  autocmd FileType python silent! FM
  " -- java:
  autocmd FileType java setlocal tabstop=3
  autocmd FileType java setlocal shiftwidth=3
  autocmd FileType java setlocal softtabstop=3
  autocmd FileType java setlocal foldcolumn=2
  " -- C:
  autocmd FileType c setlocal foldcolumn=2
  " -- C++:
  autocmd FileType cpp setlocal foldcolumn=2
  " -- eruby:
  " autocmd FileType eruby setlocal foldmethod=manual
  " autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xsd setlocal foldmethod=syntax
  " -- javascript (js)
  " (requires vim-javascript-syntax plugin)
  autocmd FileType javascript call JavaScriptFold()
  " -- coffeescript (coffee)
  " enable folding
  autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
augroup END

" -- xml/xsd:
let g:xml_syntax_folding=1


"
" ########                     ########
" ######## Recognize FileTypes ########
" ########                     ########
"
" -- octave:
augroup filetypedetect
  autocmd! BufRead,BufNewFile *.m,*.oct setfiletype octave
  " NOTE: I think this shouldn't have the bang (!)
  "  IIUC the bang deletes all autocmds of this augroup
augroup END


"
" ########                   ########
" ######## Plugins' Settings ########
" ########                   ########
"

"
" ######## netrw: ########
"
" -- File/directory browser (also supports reading/writing remote files).
"let g:netrw_liststyle=3       " default (directory) listing style: tree
"let g:netrw_list_hide='^\.'   " default listing hides files matching this
"let g:netrw_altv=1            " v places new window and cursor at the right
"let g:netrw_winsize= 90        " specify initial size of new windows (o, v)

"
" ######## nerdtree: ########
"
" -- Better file/directory browser.
" -- default open directories using nerdtree instead of netrw
let g:NERDTreeHijackNetrw=1
" -- have bookmarks pane open when nerdtree opens
"let NERDTreeShowBookmarks=1
" -- open NERDTree when vim starts (and focus it if no files were specified)
augroup nerdtreeautocmds
  " remove all autocmds for this group
  autocmd!

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter *
        \ if argc() == 0 && !exists("s:std_in") && exists("g:open_nerd_tree") |
        \   NERDTree |
        \ elseif exists("g:open_nerd_tree") |
        \   NERDTree | wincmd l |
        \ endif
  " -- close vim if the only window left open is a NERDTree
  autocmd bufenter *
        \ if winnr("$") == 1 && exists("b:NERDTreeType")
        \                    && b:NERDTreeType == "primary" |
        \   q |
        \ endif
augroup END
" -- set NERDTree window size
let g:NERDTreeWinSize=30

"
" ######## vim-misc: ########
"
" Needed for vim-session.

"
" ######## vim-session: ########
"
" -- Easier vim sessions. (using :SaveSession, :OpenSession, etc)
" -- remember:
" ++ :RestartVim
" ++ :CloseSession
" -- save (open) session on quit ('yes', 'no', or 'prompt')
let g:session_autosave='no'
" -- prompt to load default session if opening with no files (vs 'yes' or 'no')
let g:session_autoload='prompt'
" -- periodically save the session (every x minutes)
let g:session_autosave_periodic=1
" -- make autosave messages less verbose
let g:session_verbose_messages=0
" -- on startup prompt about last used session instead of default
let g:session_default_to_last=1

"
" ######## tabular: ########
"
" -- Makes it easy to align text (e.g. aligning subsequent lines on a '=' sign).
" (also required for some commands of vim-markdown)
" -- remember:
" ++ :Tabularize /<delimiter>        " works even without a range

"
" ######## vim-markdown: ########
"
" -- Syntax highlighting for markdown files, plus some useful commands &
" mappings (info here: https://github.com/plasticboy/vim-markdown)

"
" ######## python-mode: ########
"
" -- Use vim as a python ide.
" -- don't trim trailing whitespace on save
"let g:pymode_trim_whitespaces = 0
" -- disable the plugin
let g:pymode = 0

"
" ######## syntastic: ########
"
" -- detect syntax errors in various languages
" (you need to have appropriate syntax checkers installed - see :SyntasticInfo)
" -- select checker to use for javascript files
let g:syntastic_javascript_checkers = ['gjslint']
" -- check syntax when opening file
let g:syntastic_check_on_open = 1
" -- auto jump to first error (set to 1 to jump to first issue in general)
let g:syntastic_auto_jump = 2
" -- use :Errors to open a window of error descriptions
" -- suppress the 'possibly useless use of % in void context' message in eruby
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of % in void context'}

"
" ######## bufexplorer: ########
"
" -- quickly and easily switch between buffers
" -- remember:
" :BufExplorer (or my :B mapping)
" -- disable default key mappings of \be, \bs and \bv
" let g:bufExplorerDisableDefaultKeyMapping=1
" -- display detailed help
" let g:bufExplorerDetailedHelp=0
" -- show paths relative to the current directory (vs absolute)
" let g:bufExplorerShowRelativePath=1
" -- only show buffers for the specific tab (1) or show all buffers (0)
"let g:bufExplorerShowTabBuffer=0
" -- do not go to active window when selecting a buffer
" let g:bufExplorerFindActive=0
" -- show buffers on(ly?) for the specific tab
" let g:bufExplorerShowTabBuffer=1

"
" ######## vim-colors-solarized: ########
"
" -- solarized colorscheme
" -- enable syntax highlighting (done earlier)
"syntax enable
" -- switch the colorscheme on
colorscheme solarized
" -- set the background
set background=dark

"
" ######## vim-bufonly: ########
"
" -- delete all buffers but the current one (or <n>)
" ++ :BufOnly [<n>]
" ++ (aliases :Bonly, :BOnly, :Bufonly)

"
" ######## vim-rails: ########
"

"
" ######## vim-bundler: ########
"
" -- recommended by vim-rails - not technically needed, but it helps

"
" ######## emmet-vim: ########
"
" -- for high-speed html and css

"
" ######## vim-superman: ########
"
" -- open manpages with vim
" -- required for the vman (custom bash) command to work

"
" ######## ri.vim: ########
"
" -- view ri documentation inside vim
" -- remember:
" ++ ,r opens the search/autocomplete window in a horizontal split
" ++ ,R opens the search/autocomplete window in a vertical split
" ++ ,K prefills the search/autocomplete window with the keyword under cursor
" ++ K is remapped to use ri.vim if the current buffer is a *.rb file
" -- is this really needed ???

"
" ######## vim-coffee-script: ########
"
" -- for syntax highlighting of .coffee files
" (also covers indenting, compiling and more)

"
" ######## vim-airline: ########
"
" -- sections description
" ++ section b: hunks, branch
" ++ section y: fileencoding, fileformat
" ++ section z: percentage, line number, column number
"
" -- configure format of sections
" section z: minimal percentage, line number, and column number
let g:airline_section_z = '%p%% %l:%c'
"
" -- lean & mean status/tabline for vim that's light as air
" -- display all buffers when there's only one tab open
" let g:airline#extensions#tabline#enabled = 1
" ++ use "straight" ('|') separators for the tabline
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" -- truncate "branch" section if too long
"let g:airline#extensions#default#section_truncate_width = {
"    \ 'b': 10
"    \ }
" -- set the theme to solarized (it's done by default)
" let g:airline_theme = 'solarized'
" -- stop showing sections b & y
let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]
" -- configure which whitespace checks to enable
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
" autocmd FileType python let g:airline#extensions#whitespace#checks = [ 'indent' ]

"
" ######## minibufexpl: ########
"
" Elegant buffer explorer - takes very little screen space

"
" ######## vim-fugitive: ########
"
" -- I'm not going to lie to you; fugitive.vim may very well be the best Git
" wrapper of all time.

"
" ######## ctrlp.vim: ########
"
" -- Full path fuzzy file, buffer, mru, tag, ... finder for Vim.

"
" ######## vim-surround ########
"
" -- Surround.vim is all about "surroundings": parentheses, brackets, quotes,
" XML tags, and more. The plugin provides mappings to easily delete, change
" and add such surroundings in pairs.

"
" ######## vim-sneak ########
"
" Sneak is a minimalist, versatile Vim motion plugin that jumps to any
" location specified by two characters. It works with multiple lines,
" operators (including repeat . and surround), keymaps, visual mode, unicode
" ("multibyte"), and macros.

"
" ######## splitjoin.vim ########
"
" -- A vim plugin that simplifies the transition between multiline and
" single-line code
" nmap sj :SplitjoinSplit<cr>
" nmap sk :SplitjoinJoin<cr>

"
" ######## targets.vim ########
"
" -- Targets.vim is a Vim plugin that adds various text objects to give you
" more targets to operate on. It expands on the idea of simple commands like
" di' (delete inside the single quotes around the cursor).

"
" ######## vim-expand-region ########
"
" -
" vim-expand-region is a Vim plugin that allows you to visually select
" increasingly larger regions of text using the same key combination.
" -
" (continuously) press v to select increasingly larger regions of text
" vmap v <Plug>(expand_region_expand)
" -
" shrink selected region
" vmap <leader>v <Plug>(expand_region_shrink)
" -
" extend the global default objects
" (requires corresponding vim-textobj-... plugins)
" ++ custom (global) text objects
" let g:expand_region_custom_text_objects =
"     \ { 'a]':1, 'ab':1, 'aB':1, 'ii':0, 'ai':0 }
" ++ let expand_region know about them
" call expand_region#custom_text_objects(g:expand_region_custom_text_objects)
" -
" set/extend the ruby-specific text objects
" ('im' & 'am' require vim-ruby, and 'ir' & 'ar' require vim-textobj-rubyblock)
" ++ custom ruby text objects
" let g:expand_region_custom_text_objects_ruby =
"     \ { 'im':0, 'am':0, 'ir':0, 'ar':0 }
" ++ let expand_region know about them (apply only on ruby files)
" call expand_region#custom_text_objects('ruby',
"      \ g:expand_region_custom_text_objects_ruby)

"
" ######## vim-textobj-user ########
"
" -- vim-textobj-user is a Vim plugin to create your own text objects without
" pain
" -- (required by vim-textobj-rubyblock)

"
" ######## vim-textobj-line ########
"
" -- A custom text object for selecting a line.
" -- remember:
" ++ il          line w/o leading & trailing spaces and newline char (e.g. vil)
" ++ al          whole line w/o newline char (e.g. val)

"
" ######## vim-textobj-entire ########
"
" -- A custom text object for selecting the entire document.
" -- remember:
" ++ ie          whole line (e.g. vil)
" ++ ae          whole line (e.g. val)

"
" ######## vim-textobj-rubyblock ########
"
" A custom text object for selecting ruby blocks.
" -
" remember:
" ++ ir          inner ruby block (e.g. vir)
" ++ ar          outer ruby block (e.g. var)

"
" ######## vim-textobj-indent ########
"
" A custom text object for selecting based on indentation.
" -
" remember:
" ++ ai          block of lines similarly (or more) indented to the current
"                 (empty lines are just passed over - i.e. ignored, included)
" ++ ii          same as ai but stop if you encounter an empty line
" ++ aI          block of lines indented exactly the same as the current
"                 (stop if a line is more indented)
" ++ iI          same as aI

"
" ######## vim-tmux-navigator ########
"
" When combined with a set of tmux key bindings, the plugin will allow you to
" navigate seamlessly between vim and tmux splits using a consistent set of
" hotkeys.
" -
" requires tmux v1.8 or higher



"
" ########                              ########
" ######## PLUGINS DISTRIBUTED WITH VIM ########
" ########                              ########
"
" (copy them from $VIMRUNTIME/ftplugin/ to ~/.vim/plugin)
"
"
" ######## man.vim: ########
"
" -- view manpages from inside vim (tags work)
" -- :Man <command>

"
" ######## matchit.vim ########
"
" -- % matches html tags etc in addition to parentheses etc
" -- (also required by vim-textobj-rubyblock)
"runtime macros/matchit.vim

" ######## FastFold.vim ########
"
" -- stop foldmethod=syntax (et al.) from bogging down your vim
" -- folds are only recomputed on buffer save (and some other cases)
"  and foldmethod manual is used the rest of the time

" ######## vim-javascript-syntax ########
"
" -- Syntax highlighting and folding for javascript.

" ######## javascript-libraries-syntax ########
"
" -- Syntax file for JavaScript libraries. (jQuery etc)
" -- Set up which libs you use:
let g:used_javascript_libs = 'jquery,requirejs,jasmine,chai,handlebars'

" ######## indentLine ########
"
" --
" -- Specify whether the first indent level should be shown.
" let g:indentLine_showFirstIndentLevel = 1
" -- Specify whether the indentation level vertical lines should be shown.
" let g:indentLine_enabled = 0
" -- Turn it off for all files except python ones
" let g:indentLine_loaded = 0
" let g:indentLine_fileType = ['py']
" -- Specify whether to show leading spaces by default.
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceEnabled = 1
" -- Specify a character to show for leading spaces.
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceChar = '.'

" ######## supertab ########
"
" --
" make tab navigate the completion menu from top to bottom
" let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" --
" take context into account when completing
" (e.g. "/usr/l<tab>" will do filename completion)
" (e.g. "myvar.t<tab>" will do user completion if available; else omni)
let g:SuperTabDefaultCompletionType = "context"
" --
" improve vim's 'longest' completeopt setting
let g:SuperTabLongestEnhanced = 1
" --
" Sets whether or not to pre-highlight the first match when completeopt
" has the popup menu enabled and the 'longest' option as well.
let g:SuperTabLongestHighlight = 1
" --
" Temporarily override 'ignorecase' by setting to either 'ignore' or 'match'.
let g:SuperTabCompleteCase = 'match'

" ######## jedi-vim ########
"
" --
" use a new tab when going to a definition
" let g:jedi#use_tabs_not_buffers = 1
" --
" use a split when going to a definition (left/right/top/bottom/winwidth)
" let g:jedi#use_splits_not_buffers = "left"
" --
" display function call signature in command line ("2") instead of a buffer ("1")
" (might be necessary to improve the integrity of vim's undo history)
" let g:jedi#show_call_signatures = "2"
" --
" disable completions but keep all other features
" let g:jedi#completions_enabled = 0
" --
" don't want the docstring window to popup during completion?
" autocmd FileType python setlocal completeopt-=preview
" --
" disable autocomplete popup on typing '.' (will still get when hitting <tab>)
let g:jedi#popup_on_dot = 0

" ######## bkad/CamelCaseMotion ########
"
" --
" create the mappings
" call camelcasemotion#CreateMotionMappings(',')
" TODO: re-add this

" ######## wincent/command-t ########
"
" --
" make <esc> work in terminal vim
" if &term =~ "xterm" || &term =~ "screen"
"   let g:CommandTCancelMap = ['<esc>', '<c-c>']
" endif
" TODO: re-add this

" ######## francoiscabrol/ranger.vim ########
"
" --
" don't add default shortcuts
let g:ranger_map_keys = 0
" --
" shortcut to open ranger
nnoremap <leader>f :Ranger<cr>
nnoremap <leader>F :RangerNewTab<cr>



"
" ########       ########
" ######## Folds ########
" ########       ########
"
" don't underline folds
highlight Folded term=bold cterm=bold


"
" ########            ########
" ######## Colors etc ########
" ########            ########
"
" color line numbering dark grey (was orange)
"highlight LineNr ctermfg=239
" color folds' background
"highlight Folded ctermbg=234
" color folds' foreground (letters)
"highlight Folded ctermfg=240
" color fold column
"highlight FoldColumn ctermbg=234
" color of the colored (80th) column
"highlight ColorColumn ctermbg=234
" default highlighting for SpecialKey and NonText highlight groups
highlight SpecialKey ctermfg=236 ctermbg=8
highlight NonText    ctermfg=236 ctermbg=8
" highlight SpecialKey term=bold cterm=bold ctermfg=11 ctermbg=2
" highlight NonText    term=bold cterm=bold ctermfg=235 ctermbg=8
" highlight NonText        term=bold cterm=bold ctermfg=11 gui=bold guifg=Blue
" color foreground after ColorColumn magenta and background normal
" highlight ColorColumn ctermfg=5 ctermbg=8
" color background after ColorColumn normal
highlight ColorColumn ctermbg=0

" color of sign column (i.e. the column on the left that points out errors)
highlight clear SignColumn
" highlight SignColumn ctermbg=0

