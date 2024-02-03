"
" ######## README ########
"
" To install plugins, the first time you open vim do: `:PluginInstall`
"
"
" ######## Set up plugin manager ########
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
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
" -- Quickfix list (same for all windows)
" ++ :vimgrep puts output there
" ++ :grep as well
" ++ :Ggrep as well (fugitive)
"
" ++ :cw   : open quickfix list if there are errors; close it otherwise
" ++ :cn   : jump to next quickfix line
" ++ :cc 2 : jump to 2nd quickfix line
"
" -- Location list (one per window)
" ++ :lvimgrep puts output there
" ++ :lgrep as well
" ++ :Glgrep as well (fugitive)
"
" ++ :lw   : open location list if there are errors; close it otherwise
" ++ :ln   : jump to next location-list line
" ++ :ll 2 : jump to 2nd location-list line
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
" ++ za      toggle fold (open/closed)
" ++ zA      on closed fold: open it and all sub-folds recursively
"            on open fold: it will close ALL folds recursively (bad)
"            use :BetterZA instead
" ++ zv      open just enough folds to show the line the cursor is on
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
" ########         ########
" ######## GENERAL ########
" ########         ########
"
" don't emulate the original vi's bugs and limitations:
set nocompatible
" enable syntax highlighting
syntax on



"
" ########                ########
" ######## Plugin manager ########
" ########                ########
"

call plug#begin()

" A collection of language packs for Vim.
" - It won't affect your startup time, as scripts are loaded only on demand*.
" - It installs and updates 100+ times faster than 100+ packages it consist of.
" - Solid syntax and indentation support. Only the best language packs.
Plug 'sheerun/vim-polyglot'
" --
" Individual language packs can be disabled as follows:
" let g:polyglot_disabled = ['ansible']
" Disable graphql temporarily to avoid an error when opening js files
" (g:graphql_javascript_tags not defined or smth)
let g:polyglot_disabled = ['graphql']
" --
" Fix the issue where .js files get filetype javascript.jsx:
let g:jsx_ext_required = 1
" --
" vim-markdown: Fix markdown indentation on new list item
let g:vim_markdown_new_list_item_indent = 0

" Stop foldmethod=syntax (et al.) from bogging down your vim.
" Folds are only recomputed on buffer save (and some other cases)
" and foldmethod manual is used the rest of the time.
" Plug 'Konfekt/FastFold'

" Fancy fold texts
" Folded sections show more-or-less the first line of the fold,
" e.g. the method signature, the class name, etc.
Plug 'Konfekt/FoldText'

" Syntax file for JavaScript libraries. (jQuery etc)
" Plug 'othree/javascript-libraries-syntax.vim'

" Enhanced javascript syntax file.
" Plug 'jelera/vim-javascript-syntax'

" Use vim as a python ide.
" (I also have it disabled via its settings)
" (this is said to conflict with jedi-vim and other stuff)
" Plug 'klen/python-mode'

" Switch between single and multi-line statements with gS/gJ.
" Plug 'AndrewRadev/splitjoin.vim'

" Make Vim handle line and column numbers in file names with a minimum of fuss
" Allows you to open a specific file on a specific file via bash:
" `vim my_file.rb:154`
Plug 'wsdjeg/vim-fetch'

" Asynchronous syntax checking through external checkers (needs vim 8 or neovim)
Plug 'w0rp/ale'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
" --
" keep the sign gutter open at all times
let g:ale_sign_column_always = 1
" --
" Limit which linters to run for specific filetypes:
" - limit html to 'tidy'
" - enable linting for text ('proselint') (text linters disabled by default)
let g:ale_linters = {
      \ 'html': ['tidy'],
      \ 'text': ['proselint'],
      \ 'javascript': ['eslint', 'prettier'],
      \ }

" - disable/ignore some linters
let g:ale_linters_ignore = {
      \ 'ruby': ['standardrb'],
      \ }

" --
" Use `bundle exec rubocop` instead of plain `rubocop`:
let g:ale_ruby_rubocop_executable = 'bundle'

" Enable/disable auto-linting ...
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" ... on opening a file:
" let g:ale_lint_on_enter = 0
" g:ale_lint_on_save = 0

" --
" enable airline ale extension
let g:airline#extensions#ale#enabled = 1
" --
" don't underline the segment of the line that has the error/warning
let g:ale_set_highlights = 0
" --
" disable ale for ruby files under yogurt
" let g:ale_pattern_options = {
"       \ 'yogurt/.*\.rb': { 'ale_enabled': 0 },
"       \ 'yogurt/.*\.erb': { 'ale_enabled': 0 },
"       \ }
" --
" Fixers for command :ALEFix
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ }
let g:ale_fix_on_save = 1



" Align text using `:Tabularize /<delimiter>`
Plug 'godlygeek/tabular'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline (make airline play well with solarized)
Plug 'vim-airline/vim-airline-themes'

" Precision colorscheme (solarized).
Plug 'altercation/vim-colors-solarized'

" Comment stuff out using `gcc` (current line) or `gc<movement>` (multi-line)
Plug 'tpope/vim-commentary'

" A git wrapper so awesome it should be illegal.
Plug 'tpope/vim-fugitive'

" Miscellaneous auto-load Vim scripts (required by vim-session).
Plug 'xolox/vim-misc'

" Extended session management (:mksession on steroids).
Plug 'xolox/vim-session'

" Ruby on Rails power tools
Plug 'tpope/vim-rails'

" This plugin adds Go language support for Vim:
" - :GoBuild, :GoInstall, :GoRun
" - :GoTest (and :GoTestFunc for a single test)
" - :GoDebugStart to debug with delve.
" - Completion and many other features support via `gopls`.
" - formatting on save keeps the cursor position and undo history.
" - Go to symbol/declaration with :GoDef.
" - Look up documentation with :GoDoc or :GoDocBrowser.
" - Easily import packages via :GoImport, remove them via :GoDrop.
" - Precise type-safe renaming of identifiers with :GoRename.
" - See which code is covered by tests with :GoCoverage.
" - Add or remove tags on struct fields with :GoAddTags and :GoRemoveTags.
" - Lint your code with :GoLint or :GoMetaLinter, run your code through :GoVet to catch static errors, or make sure errors are checked with :GoErrCheck.
" - Advanced source analysis utilizing gopls, such as :GoImplements, :GoCallees, and :GoReferrers.
" - Integration with gopls.
" - The gopls instance can be shared with other Vim plugins.
" - Integration with Tagbar via gotags.
" - Integration with Ultisnips and other snippet engines.
"
" WARNING: vim-polyglot only supports filetype detection and syntax highlighting,
"          so we need this for formatting on save etc.
Plug 'fatih/vim-go'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file
" and get an overview of its structure. It does this by creating a sidebar that displays
" the ctags-generated tags of the current file, ordered by their scope. This means that
" for example methods in C++ are displayed under the class they are defined in.
" - :TagbarToggle toggles the Tagbar window
Plug 'preservim/tagbar'

" Command-T is a Vim plug-in that provides an extremely fast "fuzzy" mechanism for:
"   Opening files and buffers
"   Jumping to tags and help
"   Running commands, or previous searches and commands
" with a minimal number of keystrokes.
" Plug 'wincent/command-t'
" make <esc> work in terminal vim
" if &term =~ "xterm" || &term =~ "screen"
"   let g:CommandTCancelMap = ['<esc>', '<c-c>']
" endif

" All about "surroundings": parentheses, brackets, quotes, XML tags, and more.
" - cs<old_surrounding><new_surrounding> to change surrounding
" - ds<surrounding> to delete the surrounding
" - ys<text_object><surrounding> to add surrounding to text object
" - S<surrounding> in visual mode
" - surroundings: " ' ( ) [ ] { } <q> <em> <some_tag attr='val> ...
Plug 'tpope/vim-surround'

" Make `.` work for tpope plugins (surround, unimpaired, commentary, and more).
Plug 'tpope/vim-repeat'

" Pairs of handy bracket mappings
" - [q / ]q: go to previous/next quickfix entry
" - [Q / ]Q: go to first/last quickfix entry
" - [e / ]e: bubble line up/down
" - [<space> / ]<space>: insert blank line above/below
Plug 'tpope/vim-unimpaired'

" Vim plugin, insert or delete brackets, parens, quotes in pair
" Plug 'jiangmiao/auto-pairs'

" Text objects for entire buffer ie/ae.
" Plug 'kana/vim-textobj-entire'

" Text objects for indented blocks of lines.
" Plug 'kana/vim-textobj-indent'

" Text objects for the current line.
" Plug 'kana/vim-textobj-line'
" omap il <Plug>(textobj-line-i)
" omap al <Plug>(textobj-line-a)

" Text object for ruby blocks.
" (use 'ir' & 'ar' for inner and outer rubyblock)
" Plug 'nelstrom/vim-textobj-rubyblock'

" Create your own text objects (required by other plugins).
" Plug 'kana/vim-textobj-user'

" Seamless navigation between tmux panes and vim splits.
Plug 'christoomey/vim-tmux-navigator'

" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" Closes brackets. Perfect companion to vim-endwise.
" Basically, a more conservative version of auto-pairs that only works when you press Enter.
Plug 'rstacruz/vim-closer'

" Configure tab labels within Terminal Vim with a very succinct output.
Plug 'mkitt/tabline.vim'

" Display the indention levels with thin vertical lines.
" Plug 'Yggdroot/indentLine'

" Automatically opens popup menu for completions.
" Plug 'vim-scripts/AutoComplPop'

" Perform all your vim insert mode completions with Tab.
Plug 'ervandew/supertab'

" Using the jedi (python) autocompletion library for VIM.
" - will show function params as you type
" - seems that it works with supertab (even for function params)
" - K (in normal mode) will pop up documentation for a function or class
" - `:Pyimport <module>` opens the <module> module
" - completes stuff with <c-space> (configurable) - but no need since it
"   works with <tab> as well
Plug 'davidhalter/jedi-vim'
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
" --
" disable mapping for jedi#usages() (shows usages of a name)
" (because it clashes with my <leader>n mapping)
let g:jedi#usages_command = ''

" Start a * or # search from a visual block
" (select some text using Vim's visual mode and then hit * and # to search
" for it elsewhere in the file)
Plug 'nelstrom/vim-visual-star-search'

" Toggles between relative and absolute line numbers automatically
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" I've got a shortcut to turn relativenumber on/off.

" A Vim plugin for indent-level based motion
"   [- : Move to previous line of lesser indent than the current line.
"   [+ : Move to previous line of greater indent than the current line.
"   [= : Move to previous line of same indent as the current line that is
"        separated from the current line by lines of different indents.
"   ]- : Move to next line of lesser indent than the current line.
"   ]+ : Move to next line of greater indent than the current line.
"   ]= : Move to next line of same indent as the current line that is separated
"        from the current line by lines of different indents.
Plug 'jeetsukumaran/vim-indentwise'

" Use <c-a>/<c-x> to increment dates, times, and more
" Plug 'tpope/vim-speeddating'

" A vim script to provide CamelCase motion through words
" I'll use `,w` `,e` `,ge` `,b` to move across CamelCase/snake_case words.
" `i,w` `i,e` `i,ge` `i,b` will be the text objects.
Plug 'bkad/CamelCaseMotion'
" --
" create the mappings using ',' as the prefix
let g:camelcasemotion_key = ','

" Replace text with the contents of a register
"   [count]["x]gr{motion} Replace {motion} text with the contents of register x.
"   [count]["x]grr        Replace [count] lines with the contents of register x.
"   {Visual}["x]gr        Replace the selection with the contents of register x.
Plug 'vim-scripts/ReplaceWithRegister'

" Ranger integration in vim and neovim
"   use `:Ranger` to open ranger in the current file's directory
"   use `:RangerWorkingDirectory` to open ranger in the current workspace
"     (current workspace is the directory vim is currently `cd`ed into)
Plug 'francoiscabrol/ranger.vim'
" --
" open ranger instead of netrw when opening a directory
let g:ranger_replace_netrw = 1
" --
" don't add default shortcuts
let g:ranger_map_keys = 0
" --
" shortcut to open ranger
" nnoremap <leader>f :Ranger<cr>
" nnoremap <leader>F :RangerNewTab<cr>

" Provide easy code formatting in Vim by integrating existing code formatters.
" TODO: check
" Plug 'Chiel92/vim-autoformat'

" A Vim plug-in that calculates the Flesch-Kincaid readability index per line.
" Dependencies:
" Plug-in requires the odyssey ruby library for calculating the index.
" TODO: check
" Plug 'pondrejk/vim-readability'

" Distraction-free writing in Vim.
" Best served with limelight.vim.
" TODO: check
" Plug 'junegunn/goyo.vim'

" Hyperfocus-writing in Vim.
" Best served with Goyo.vim. Works on 256-color terminal or on GVim.
" TODO: check
" Plug 'junegunn/limelight.vim'

" Unobtrusive scratch window. Inspired by scratch.vim, enhanced.
" - `:Scratch` opens a scratch buffer in a new window (by default using the
"   top 20% of the screen, configurable via g:scratch_height and
"   g:scratch_top). The window automatically closes when inactive (and its
"   contents will be available the next time it is opened).
" - `gs` in normal mode opens the scratch window and enters insert mode. The
"   scratch window closes when you leave insert mode. This is especially
"   useful for quick notes.
" - `gs` in visual mode pastes the current selection (character-wise, line-wise
"   or block-wise) into the scratch buffer.
" - Both above mappings have a gS variant that clears the scratch buffer
"   before opening it.
Plug 'mtth/scratch.vim'
" --
" set scratch window's height
" (if int it means num of columns - if float it means percentage of window)
let g:scratch_height = 0.5


" A bundle of fzf-based commands and mappings extracted from junegunn's .vimrc
" (fzf installed via homebrew)
Plug 'junegunn/fzf.vim'

" TODO: make ctrl-d close the selected buffer in fzf-buffer-list
" let g:fzf_action = {
"   \ 'ctrl-d': function(<some-function-that-takes-fzf-result-lines-and-deletes-buffers>),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" React JSX syntax highlighting and indenting for vim.
" Plug 'mxw/vim-jsx'

" [Vim script] React JSX syntax pretty highlighting for vim.
Plug 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1

" Auto close (X)HTML tags
" Usage:
" `<table` -> (press ">") -> `<table></table>` ->
"       (press ">" again) -> cursor placed on new line between the tags
" NOTE: Unfortunately this doesn't work with ".erb" files..
" Plug 'alvan/vim-closetag'

" A vim plugin to perform diffs on blocks of code
" - performs diffs within the same file
" - usage:
"   - enter visual line mode, select some lines, type :Linediff,
"     select the 2nd block of lines, and type :Linediff again
"     type :LinediffReset to exit
"   - when on a merge conflict, type :LinediffMerge
"   - when viewing diffs:
"     - `]c`: (next difference)
"     - `[c`: (previous difference)
"     - `do`: (diff obtain)
"     - `dp`: (diff put)
Plug 'AndrewRadev/linediff.vim'

" A smart, fast, simple, and reliable keyword completion replacement for Vim
" (works with supertab)
" Plug 'szw/vim-kompleter.git'

" A super simple, super minimal, super light-weight tab-completion plugin for Vim.
" Plug 'ajh17/vimcompletesme'

" Provides insert mode auto-completion for quotes, parens, brackets, etc
" Plug 'Raimondi/delimitMate'

" Emoji in Vim
" Plug 'junegunn/vim-emoji'

" Brings physics-based smooth scrolling to the Vim world!
" Plug 'yuttie/comfortable-motion.vim'

" Peekaboo will show you the contents of the registers on the sidebar when
" you hit `"` or `@` in normal mode or <CTRL-R> in insert mode. The sidebar
" is automatically closed on subsequent key strokes.
" You can toggle fullscreen mode by pressing spacebar.
" Plug 'junegunn/vim-peekaboo'

" Run your favorite search tool (ack) from Vim, with an enhanced results list.
" - usage: `:Ack [options] {pattern} [{directories}]`
" TODO: check (from papanikge)
" Plug 'mileszs/ack.vim'

" This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically
" based on the current file.
" TODO: check (from papanikge)
" Plug 'tpope/vim-sleuth'

" Ghetto HTML/XML mappings - Enhances surround.vim with `<% %>` etc
" TODO: check (from papanikge)
" Plug 'tpope/vim-ragtag'

" Better Rainbow Parentheses
" TODO: check (from papanikge)
" Plug 'kien/rainbow_parentheses.vim'

" The ultimate undo history visualizer for VIM
" TODO: check (from papanikge)
Plug 'mbbill/undotree' ", { 'on': 'UndotreeToggle' } TODO: use this with Plug

" A REST console for Vim.
" TODO: check (from papanikge)
" Plug 'diepm/vim-rest-console' ", { 'for': 'rest' }

" Do a tig in your vim
" Usage: `:Tig` try it while the cursor is on a commit hash or anywhere else
Plug 'codeindulgence/vim-tig'
command! Tgi :Tig

" A simple tool for presenting slides in vim based on text files.
" Plug 'sotte/presenting.vim'

" Preview colors in source code while editing
" Plug 'ap/vim-css-color'

" Vim plugin to list, select and switch between buffers.
"
" Use <Leader>b (typically: \b) to open a window listing all buffers.
" In this window, you can use normal movement keys to select a buffer and then:
" - <ENTER> to edit the selected buffer in the previous window
" - <C-V> to edit the selected buffer in a new vertical split
" - <C-S> to edit the selected buffer in a new horizontal split
" - <C-T> to edit the selected buffer in a new tab page
"
" Use gb (or <M-b>) and gB (or <M-S-b>) to flip through the most-recently used
" buffer stack without opening the buffer listing "drawer".
"
" Use <Leader><LEFT>, <Leader><UP>, <Leader><RIGHT>, <Leader><DOWN> to split a
" new window left, up, right, or down, respectively, and edit the previous MRU
" buffer there.
"
" Many other options are supported: (e.g. open in existing window/tab, or in
" the same window; preview buffer without leaving buffer listing; "pin" the
" buffer listing so that it is open all the time, etc. etc.)
Plug 'jeetsukumaran/vim-buffergator'

" A Vim wrapper for running tests on different granularities.
" - :TestNearest
" - :TestFile
" - :TestSuite
" - :TestLast
" - :TestVisit
Plug 'vim-test/vim-test'

" Language Server Protocol support for vim and neovim.
" Supports Ruby's solargraph gem.
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }

" VIM PostCSS Sorting
"
" Usage: `:CSSSorting<cr>`
" nnoremap <Leader>cs :CSSSorting<CR>
Plug 'bkaney/vim-postcss-sorting'

" all plugins must be added before the following line (required)
call plug#end()
"
" done with plugin setup - reenable filetype indent & plugin
" filetype indent on
" filetype plugin on
"
" Brief help
" PlugInstall [name ...] [#threads]: Install plugins
" PlugUpdate [name ...] [#threads]: Install or update plugins
" PlugClean[!]: Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade: Upgrade vim-plug itself
" PlugStatus: Check the status of plugins
" PlugDiff: Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]: Generate script for restoring the current snapshot of the plugins


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

" make '§' the <leader> key
" (workaround because space won't show up in the showcmd window)
let mapleader = '§'
" but space will be the actual <leader>
nmap <space> <leader>
vmap <space> <leader>

" always show line numbers
"   when used in combination with relativenumber, it replaces 0
"   in the current line with the actual line number
" set number
" show relative numbers
" set relativenumber

" Toggle relativenumber on/off:
nnoremap <silent> <C-m> :set number!<cr>:set relativenumber!<cr>

" make every wrapped line continue visually indented
set breakindent

" enable use of fzf (fuzzy finder)
set rtp+=/usr/local/opt/fzf

" make copy and paste (outside vim) play well with vim's yank, paste etc
set clipboard=unnamed

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

" old star-search functionality (adds word-breaks around the search)
nnoremap <leader>* *
" star-search without word-breaks
nnoremap * g*

" list all buffers and get ready to switch to one of them
" nnoremap <leader>b :Buffers<cr>

" if a file has been detected to be changed outside vim reread it
" (throws an error if the file was deleted outside vim)
" (use :checktime to see if the file was changed outside vim)
set autoread

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
" nnoremap <leader>gg :read<space>!git<space>grep<space>-i<space>
command! -nargs=+ -complete=file Ggrep2 execute 'silent Ggrep!' <q-args> | cw | redraw!
" command! -nargs=+ -complete=file Ggrep2 execute 'silent Ggrep!' <q-args> | cw | set modifiable | redraw!
nnoremap <leader>gg :Ggrep2<space>-i<space>

" tab in normal mode indents
" nnoremap <tab> a<tab><esc>

" choose a colorscheme
colorscheme solarized
" colorscheme base16-default-dark
" set the background
set background=dark

" persistent undo (after quitting)
" (maintain undo history between sessions)
set undofile
" By default vim will write undo history files in the same directory
" as the file you edit. Let's create a dedicated directory instead.
"
" TODO: It would be better to have this under ~/.vim/undodir, but my
"       current setup makes that not ideal.
set undodir=~/.vim_undodir

" For insert-mode completion. Show a popup menu, with extra info for each
" match, and autocomplete with the longest common prefix of all matches.
set completeopt=menu,longest,preview


"
" ########                             ########
" ######## Automatic Indentation & TAB ########
" ########                             ########
"
" set autoindent
" `set smartindent` strips indent when you start a line with #.
" This is very frustrating in python. Just rely on `filetype autoindent on`.
" set smartindent      " try to guess the new line's indent level - PROBLEM WITH LEADING #
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


" Sessions
" ========

" Commands

com! -nargs=? -bang
       \ -complete=customlist,xolox#session#complete_names_with_suggestions
       \ SS SaveSession<bang> <args>
com! -nargs=? -bang -complete=customlist,xolox#session#complete_names
       \ OO OpenSession<bang> <args>
com! -nargs=? -bang -complete=customlist,xolox#session#complete_names
       \ OS OpenSession<bang> <args>
com! -nargs=? -bang CS CloseSession<bang> <args>

" Options

" Don't save folds in sessions.
" (to avoid errors for invalid fold ranges on session load)
set sessionoptions-=folds
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers


"
" ########                 ########
" ######## Custom Commands ########
" ########                 ########
"
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
" -- reload .vimrc
com! Reload source ~/.vimrc
" -- open .vimrc for editing (in new tab)
com! Config tabe ~/.vimrc
com! RC e ~/.vimrc

" -- refresh all windows (aka panes)
com! RefreshWindows tabdo windo edit

" -- close all hidden buffers (i.e. buffers not open in any window)
com! CloseHiddenBuffers call s:CloseHiddenBuffers()
com! Closehiddenbuffers call s:CloseHiddenBuffers()

" -- tig show commit under the cursor
com! TigShow silent execute "!tig show <cword>" | redraw!

" -- enable Ruby formatting & highlighting
com! Ruby :set filetype=ruby
com! Rb Ruby

" -- make current buffer into a scratch buffer
com! Scratchify setlocal buftype=nofile noswapfile
com! ScratchNew new | Scratchify
com! ScratchVNew vnew | Scratchify
com! ScratchTabNew tabnew | Scratchify
" com! ScratchRuby new | Scratchify | Ruby
" com! ScratchRb ScratchRuby
" com! Srb ScratchRuby

" -- open local todos file
com! Todo edit todo.md

" -- tidy an html file (break lines and indent)
com! TidyHtml :%!tidy -q -i --show-errors 0

" com! -nargs=1 -complete=customlist,s:EmojiCompleteCmdLineArg EmojiInsert call s:EmojiInsertFunc(<f-args>)

com! OpenOnGithub execute ('!open -n "'.CurrentRepoGithubURL().'"')
com! EchoCurrentSyntaxGroup :echo CurrentSyntaxGroup()

" "-range=%" means that passing a range is allowed,
" and the default is the whole file
" Format code copied from a Ruby console, so that it's prettier and
" easy to copy-paste back into another console.
command! -range=% FormatRubyConsole :<line1>,<line2>s/^.*[^=]> \?/>>/e | <line1>,<line2>s/^=>/# =>/e | <line1>,<line2>s/^[^#>]/# /e | <line1>,<line2>s/^>>//e
command! -range=% FRC FormatRubyConsole
command! -range=% Frc FormatRubyConsole



"
" ######## Functions  ########
"

function! CurrentRepoGithubURL()
  return RemoteURL().'/blob/master/'.expand('%').'\#L'.line('.')
endfunction

function! RemoteURL()
  let l:remote = system('git remote get-url --all origin')
  return substitute(substitute(substitute(substitute(l:remote, ":", "/", ""), "git@", "https://", ""), "\\.git", "", ""), '\n\+$', '', '')
endfunction

function! BranchName()
  return system('bash -c "git rev-parse --abbrev-ref HEAD"')
endfunction


" What is the syntax group for the position under the cursor?
function! CurrentSyntaxGroup()
    let l:s = synID(line('.'), col('.'), 1)
    return synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Close all hidden buffers in Vim
" (copied from https://gist.github.com/skanev/1068214)
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction


" function! s:EmojiInsertFunc(emoji)
"   exec 'normal i' . emoji#for(a:emoji)
" endfunction


" function! s:EmojiCompleteCmdLineArg(ArgLead, CmdLine, CursorPos)
"   let l:completions = emoji#complete(0, a:ArgLead)
"   let l:result = []

"   for l:completion in l:completions
"     call add(l:result, split(l:completion['word'], ':')[0])
"   endfor

"   return l:result
" endfunction



"
" ########              ########
" ######## Code Folding ########
" ########              ########
"
" -- remember:
" ++ folds must be defined by entering commands (e.g. zf)
set foldmethod=manual
" ++ groups of lines with the same indent form a fold
" set foldmethod=indent
" ++ (fdl) display x first levels of folds
"set foldlevel=x

" -- folds are defined by syntax
" set foldmethod=syntax
" -- deepest fold is x levels
set foldnestmax=7
" -- don't fold by default (so that the file isn't folded when you first open it)
set nofoldenable
" -- enable folding of vimscript files
let g:vimsyn_folding = 'af'  " fold only augroups & functions
" -- (un)set fillchars
" set fillchars="fold: "


" -- recursively open fold and subfolds, or non-recursively close fold
command! BetterToggleFold silent
  \ if IsFolded() | foldo! | else | foldc | endif
command! BetterZA BetterToggleFold

" -- is the current line folded?
function! IsFolded()
  if foldclosed(line('.')) > -1 | return 1 | else | return 0 | endif
endfunction

" -- fold html (using xml's folding rules)
command! FoldHTML :setlocal filetype=xml | :setlocal foldmethod=syntax | :setlocal foldlevel=0

" -- recompute folds with foldmethod=syntax
command! FoldSyntax :setlocal foldmethod=syntax
" -- change back to foldmethod=manual
command! FoldManual :setlocal foldmethod=manual
" -- Make zM recompute folds with foldmethod=syntax and change back to manual
" nnoremap <silent> <leader>f :FoldSyntax<cr>zM
" nnoremap <leader>F :FoldManual<cr>
nnoremap <silent> zM :FoldSyntax<cr>zM:FoldManual<cr>



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
nnoremap <silent> <leader>up :update<cr>
" ++ easy force quit with error
" nnoremap <leader>q :cq!<cr>
" ++ easy save and quit
" nnoremap <silent> <leader>x :exit<cr>
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
" noremap : ;
" tnoremap ; :   " no way to type ; if we use this
" -
" toggle current fold to open/close
nnoremap <leader>a za
nnoremap <leader>A :BetterZA<cr>
vnoremap <leader>a zf
" -
" open enough folds to show the current line
nnoremap <silent> <leader>x zx
" -
" navigate split windows (plus auto maximize/minimize vertically):
nnoremap <silent> <leader>j :wincmd<space>j<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>k :wincmd<space>k<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>h :wincmd<space>h<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>l :wincmd<space>l<cr>:wincmd<space>_<cr>
nnoremap <silent> <leader>[ :wincmd<space>p<cr>
" -
" navigate tabs
nnoremap <silent> <leader>p :tabprevious<cr>
nnoremap <silent> <leader>n :tabnext<cr>
tnoremap <silent> <leader>n :tabnext<cr>
"(remember <c-\> takes you to the previous pane
" -
" navigate buffers
nnoremap <silent> <leader>J :bnext<cr>
nnoremap <silent> <leader>K :bprevious<cr>
" -
" resize split windows easily:
nnoremap <silent> <leader>= <c-w>=
nnoremap <silent> <leader>\ <c-w>\|
nnoremap <silent> <leader>- <c-w>_
" -
" set minimum height & width of split window:
set winminheight=0
set winminwidth=0
" -
" insert stuff from normal mode (without moving):
" empty line above
" Use `[<space>` from vim-unimpaired instead!
" nnoremap <leader>O mpO<esc>0D`p
" empty line below
" Use `]<space>` from vim-unimpaired instead!
" nnoremap <leader>o mpo<esc>0D`p
" -
" nnoremap <leader>t :tab
" nnoremap <leader>e  :e<space>
nnoremap <leader>e :FZF<cr>
nnoremap <leader>T :wincmd<space>T<cr>
nnoremap <leader>s :wincmd<space>s<cr>
nnoremap <leader>v :wincmd<space>v<cr>
" force a screen refresh
noremap <leader>r :redraw!<cr>
" -
" other:
" redo syntax highlighting
nnoremap <leader>S :syntax sync fromstart<cr>
" -
" open Scratch window in normal mode
nnoremap <leader>gs :Scratch<cr>



"
" ########       ########
" ######## Misc. ########
" ########       ########
"
set formatoptions+=w  " don't break words when wrapping lines
" let &colorcolumn=join(range(81,999),',')    " color from xth column onwards
set colorcolumn=100
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
  set mouse=a         " enable mouse (in all modes)
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
" -
" Don't make windows the same size after splitting or closing a window.
set noequalalways



"
" ########                       ########
" ######## Per Filetype Commands ########
" ########                       ########
"

" xml/xsd (breaks jsx highlighting after some point)
" let g:xml_syntax_folding=1

augroup filetypefolding
  " clear all autocommands for this group when the group is redefined
  autocmd!

  " autocmd FileType python setlocal foldcolumn=2
  autocmd FileType python setlocal foldmethod=indent

  " :FM marks folds using indent folding and then switches to manual folding
  autocmd FileType python command! -buffer FM set fdm=indent | set fen |
                                 \ %foldo! | set fdm=manual
  " press<f5> when inside a docstring to manually fold it
  autocmd FileType python nnoremap <buffer> <f5> l?"""<cr>vNzf:nohlsearch<cr>
  " mark folds and switch to manual
  autocmd FileType python silent! FM

  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xsd setlocal foldmethod=syntax

  " autocmd FileType java setlocal foldcolumn=2
  " autocmd FileType c setlocal foldcolumn=2
  " autocmd FileType cpp setlocal foldcolumn=2

  autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
  autocmd BufNewFile,BufReadPost *.coffee.erb setlocal foldmethod=indent
augroup END


augroup filetypespecific
  " see which autocommands are running in real-time
  "set verbose=9

  " clear all autocommands for this group when the group is redefined
  autocmd!

  " auto reload .vimrc
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
  " autocmd FileType python setlocal listchars=trail:.
  " autocmd FileType python setlocal list
  " override highlight color for import statements
  autocmd FileType python highlight link pythonImport Define
  " -- java:
  autocmd FileType java setlocal tabstop=3
  autocmd FileType java setlocal shiftwidth=3
  autocmd FileType java setlocal softtabstop=3
  " -- eruby:
  " autocmd FileType eruby setlocal foldmethod=manual
  " autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  " --
  " recognize dashes as part of keywords (e.g. in `<my-component>`)
  autocmd FileType lisp,clojure,html,xml,xhtml,haml,eruby,css,scss,sass setlocal iskeyword+=-
  " -- go (golang):
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal shiftwidth=4
  autocmd FileType go setlocal softtabstop=4
  autocmd FileType go setlocal listchars=trail:.,tab:<->
  autocmd FileType go nnoremap <buffer> <leader>gr :GoRun<cr>
  " -- diff:
  autocmd FileType diff setlocal noexpandtab
augroup END


"
" ########                     ########
" ######## Recognize FileTypes ########
" ########                     ########
"
augroup filetypedetect
  " -
  " octave:
  autocmd! BufRead,BufNewFile *.m,*.oct setfiletype octave

  " -
  " .es6 (javascript es6 files):
  autocmd! BufRead,BufNewFile *.es6 setfiletype javascript

  " -
  " .jsx (javascript react files):
  autocmd! BufRead,BufNewFile *.jsx setfiletype javascript.jsx
augroup END


"
" ########                   ########
" ######## Plugins' Settings ########
" ########                   ########
"


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
" -- save session on quit ('yes', 'no', or 'prompt')
let g:session_autosave='no'
" -- prompt to load default session if opening with no files ('prompt'/'yes'/'no')
let g:session_autoload='no'
" -- periodically save the session (every x minutes)
let g:session_autosave_periodic=0
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
" let g:pymode = 0

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
let g:airline_section_z = '%p%% %l:%v'
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
let g:used_javascript_libs = 'underscore,jquery,requirejs,jasmine,chai,handlebars'

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


" ######## junegunn/vim-emoji ########
"
" Set up emoji completion
" set completefunc=emoji#complete

"
" ######## supertab ########
"
" --
" take context into account when completing
" (e.g. "/usr/l<tab>" will do filename completion)
" (e.g. "myvar.t<tab>" will do user completion if available; else omni)
let g:SuperTabDefaultCompletionType = "context"
" --
" fallback completion type if context doesn't find anything
" make tab navigate the completion menu from top to bottom
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" use completefunc:
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"
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

" ######## kompleter ########
"
" --
" Don't replace standard completion mappings `<c-n>/<c-p>` with `<c-x><c-u>`
let g:kompleter_replace_standard_mappings = 0

" ######## pangloss/vim-javascript ########
"
" Enable syntax highlighting for Flow
" let g:javascript_plugin_flow = 1

" Enable code folding for javascript based on our syntax file.
" Please note this can have a dramatic effect on performance.
augroup javascript_folding
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
augroup END




"
" ########       ########
" ######## Folds ########
" ########       ########
"
" don't underline folds
highlight Folded term=bold cterm=bold



" ########            ########
" ######## Colors etc ########
" ########            ########

" other highlight groups: LineNR, Folded, FoldColumn
" default highlighting for SpecialKey and NonText highlight groups
highlight SpecialKey ctermfg=236 ctermbg=8
highlight NonText    ctermfg=236 ctermbg=8

" color background after ColorColumn normal
highlight ColorColumn ctermbg=0

" clear color of sign column (i.e. the column on the left that points out errors)
" highlight clear SignColumn

" set color of sign column
highlight SignColumn ctermbg=0

" fix highlighting of html italics (e.g. inside the <em> tag)
highlight htmlItalic ctermfg=7

com! -range FormatJSON <count>!python -m json.tool
