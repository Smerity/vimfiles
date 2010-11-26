" Don't make this Vi
set nocompatible

""" Pathogen
call pathogen#runtime_append_all_bundles()

""" Useful small things
" Mouse support
set mouse=a
" Map jj to escape insert mode
inoremap jj <Esc>
" Highlight matching parenthesis
highlight MatchParen term=reverse ctermbg=Black
"ctermbg=Black
"set showmatch
" Add a closing right parenthesis whenever a left one is inserted
":imap ( ()<C-[>i
":let g:lisp_rainbow = 1
" Map control-backspace to delete the previous word
"DOESN'T WORK :imap <C-BS> <C-W>
" Make :w!! allow you to use sudo to write to a file
cmap w!! %!sudo tee > /dev/null %
" Space will toggle folds!
"nnoremap <space> za

""" Spelling
" [s (prev), ]s (next), z= (correct), zg (add word), zug (undo word add)
" set spell|nospell

""" Syntax / Commenting
syntax on
" <C-C> is usually the equivalent to <Esc> - possibly remap?
" EnhancedCommentify - insert / visual / normal mode mappings
imap <C-C> <ESC><Plug>Traditionalji
vmap <C-C> <Plug>VisualFirstLinej
" Escape at end as Traditional enters into insert mode
map <C-C> <Plug>Traditionalji<ESC>
" Briefly highlight the matching bracket when selected
set number
""" Rainbow colours
"call rainbow_parenthsis#LoadRound()
function RainCol(raintype)
     call rainbow_parenthsis#Activate()
     exe "call rainbow_parenthsis#" . a:raintype . "()"
endfunction
autocmd BufWinEnter *.py call RainCol("LoadRound")
autocmd BufWinEnter *.c,*.cc,*.css,*.h call RainCol("LoadBraces")

""" Indenting
set expandtab
set shiftwidth=2
set softtabstop=2
" Indenting using detectindent
:let g:detectindent_preferred_expandtab = 1
" Equivalent to setting shiftwidth and tabstop
:let g:detectindent_preferred_indent = 2
" Maximum number of lines to analyse for tab statistics
:let g:detectindent_max_lines_to_analyse = 1024
" Automatically run DetectIndent on source files
"autocmd BufReadPost * :DetectIndent
autocmd BufReadPost *.py :DetectIndent
autocmd BufReadPost *.c :DetectIndent
autocmd BufReadPost *.cc :DetectIndent
autocmd BufReadPost *.css :DetectIndent
autocmd BufReadPost *.vim :DetectIndent
autocmd BufReadPost *.h :DetectIndent
" Copy previous line's indentation
set autoindent
" Automatically inserts one extra level of indentation in some cases
set smartindent
"set cindent
" setlocal cinwords=if,else,elseif...

""" Restore previous cursor position
if has("autocmd")
     autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif

""" snipMate
filetype plugin on

""" Search
set incsearch
set hlsearch
set ignorecase
" Use Enter to clear search highlight
:noremap <CR> :nohlsearch<CR>/<BS><CR>

" Useful hints and tips
"shift + k => man (for C)

"+-----------------------------------------+---------------------------------------+
"| select                                  | v                                     |
"+-----------------------------------------+---------------------------------------+
"| select row(s)                           | SHIFT + v                             |
"+-----------------------------------------+---------------------------------------+
"| select blocks (columns)                 | CTRL  + q                             |
"+-----------------------------------------+---------------------------------------+
"| indent selected text                    | >                                     |
"+-----------------------------------------+---------------------------------------+
"| unindent selected text                  | <                                     |
"+-----------------------------------------+---------------------------------------+
"| list buffers                            | :ls                                   |
"+-----------------------------------------+---------------------------------------+
"| open buffer                             | :bN (N = buffer number)               |
"+-----------------------------------------+---------------------------------------+
"| print                                   | :hardcopy                             |
"+-----------------------------------------+---------------------------------------+
"| open a file                             | :e /path/to/file.txt                  |
"|                                         | :e C:\Path\To\File.txt                |
"+-----------------------------------------+---------------------------------------+
"| sort selected rows                      | :sort                                 |
"+-----------------------------------------+---------------------------------------+
"| search for word under cursor            | *                                     |
"+-----------------------------------------+---------------------------------------+
"| open file under cursor                  | gf                                    |
"|   (absolute path or relative)           |                                       |
"+-----------------------------------------+---------------------------------------+
"| format selected code                    | =                                     |
"+-----------------------------------------+---------------------------------------+
"| select contents of entire file          | ggVG                                  |
"+-----------------------------------------+---------------------------------------+
"| convert selected text to uppercase      | U                                     |
"+-----------------------------------------+---------------------------------------+
"| convert selected text to lowercase      | u                                     |
"+-----------------------------------------+---------------------------------------+
"| convert tabs to spaces                  | :retab                                |
"+-----------------------------------------+---------------------------------------+
"| start recording a macro                 | qX (X = key to assign macro to)       |
"+-----------------------------------------+---------------------------------------+
"| stop recording a macro                  | q                                     |
"+-----------------------------------------+---------------------------------------+
"| playback macro                          | @X (X = key macro was assigned to)    |
"+-----------------------------------------+---------------------------------------+
"| replay previously played macro *        | @@                                    |
"+-----------------------------------------+---------------------------------------+
"| auto-complete a word you are typing **  | CTRL + n                              |
"+-----------------------------------------+---------------------------------------+
"| bookmark current place in file          | mX (X = key to assign bookmark to)    |
"+-----------------------------------------+---------------------------------------+
"| jump to bookmark                        | `X (X = key bookmark was assigned to  |
"|                                         |     ` = back tick/tilde key)          |
"+-----------------------------------------+---------------------------------------+
"| show all bookmarks                      | :marks                                |
"+-----------------------------------------+---------------------------------------+
"| delete a bookmark                       | delm X (X = key bookmark to delete)   |
"+-----------------------------------------+---------------------------------------+
"| delete all bookmarks                    | delm!                                 |
"+-----------------------------------------+---------------------------------------+
"| split screen horizontally               | :split                                |
"+-----------------------------------------+---------------------------------------+
"| split screen vertically                 | :vsplit                               |
"+-----------------------------------------+---------------------------------------+
"| navigating split screens                | CTRL + w + j = move down a screen     |
"|                                         | CRTL + w + k = move up a screen       |
"|                                         | CRTL + w + h = move left a screen     |
"|                                         | CRTL + w + l = move right a screen    |
"+-----------------------------------------+---------------------------------------+
"| close all other split screens           | :only                                 |
"+-----------------------------------------+---------------------------------------+

"*  - As with other commands in vi, you can playback a macro any number of times.
"     The following command would playback the macro assigned to the key `w' 100
"     times: 100@w

"** - Vim uses words that exist in your current buffer and any other buffer you may
"     have open for auto-complete suggestions.
