" noremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Vundle"{{{
set nocompatible              " be iMproved, required
filetype off                  " required

if has('win32') || has('win64')
    set directory=$HOME\\temp\\
    set backupdir=$HOME\\temp\\
    set rtp+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set directory=$HOME/temp/
    set backupdir=$HOME/temp/
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"help"{{{
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9' 
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"}}}
"Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-speeddating'
Plugin 'chrisbra/NrrwRgn'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'vim-scripts/occur.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'easymotion/vim-easymotion'

" https://github.com/diepm/vim-rest-console
Plugin 'diepm/vim-rest-console'

Plugin 'ervandew/supertab'
" Plugin 'itchyny/calendar.vim'
Plugin 'mattn/calendar-vim'
"""mattn/calendar-im   http://www.vim.org/scripts/script.php?script_id=52
Plugin 'jlanzarotta/bufexplorer'
Plugin 'LargeFile'
Plugin 'lpenz/vimcommander'
Plugin 'multvals.vim'
Plugin 'oplatek/Conque-Shell'
Plugin 'project.tar.gz'
Plugin 'scrooloose/nerdtree'
Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
" Plugin 'vim-scripts/EnhCommentify.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/genutils'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/pydoc.vim'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'vim-scripts/YankRing.vim'
" Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'vim-scripts/ZoomWin'
Plugin 'yegappan/grep'
" Plugin 'yegappan/mru'
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'vimwiki/vimwiki'
"vikitasks"{{{
"Plugin 'tomtom/vikitasks_vim'
"Plugin 'tomtom/tlib_vim'
"Plugin 'tomtom/trag_vim'
"Plugin 'tomtom/hookcursormoved_vim'
"}}}
" Plugin 'klen/python-mode'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'dhruvasagar/vim-dotoo'

" Plugin 'vimoutliner/vimoutliner'

"Plugin 'aaronbieber/vim-quicktask'
" Plugin 'davidoc/taskpaper.vim'
Plugin 'jceb/vim-orgmode'
" Plugin 's3rvac/AutoFenc'
Plugin 'stephpy/vim-yaml'
Plugin 'robbles/logstash.vim'
" Plugin 'pearofducks/ansible-vim'

"VTD stuff
"Plugin 'google/maktaba'
"Plugin 'google/glaive'
" Install VTD.
"Plugin 'chiphogg/vim-vtd'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"call glaive#Install()
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"

"}}}

"set verbosefile=~/vimverbose.log
"set verbose=15
set diffopt+=iwhite
" base behavior settings "{{{
set nocompatible
set nocursorline
set nosmartindent

" if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"   set fileencodings=utf-8,latin1
" endif
"
if &t_Co > 2 || has("gui_running")
   syntax on
endif
"
" if &term=="xterm"
"   set t_Sb=^[4%dm
"   set t_Sf=^[3%dm
"   set ttymouse=xterm2
" endif
if &term =~ '^screen' || &term == "xterm"
        " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
filetype plugin on
filetype indent on

set background=dark
set nomodeline

set fileencodings=ucs-bom,ucs-le,utf-8,cp1251,cp866,koi8-r
set encoding=utf-8
let &termencoding = &encoding
set fileformats=unix,dos
set fileformat=unix
if has('win32') || has('win64')
    " set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
    " Отображение кириллицы во внутренних сообщениях программы
    lan mes ru_RU.UTF-8
    " Отображение кириллицы в меню
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ru_RU.UTF-8
    source $VIMRUNTIME/menu.vim
    map <Leader>v :e ~/vimfiles/vimrc<CR>
    map <Leader>n :e ~/notes.org<CR>
    autocmd! bufwritepost vimrc source %
    set fileformats=dos,unix
    set fileformat=dos
else
    map <Leader>v :e ~/.vimrc<CR>
    autocmd! bufwritepost .vimrc source %
    " map ,i :e ~/notes/index.txt<CR>
    " map ,t :e ~/notes/todo.txt<CR>
    map ,m :e ~/notes/memo.txt<CR>

endif

" set langmap=Ј`,Кq,Гw,Хe,Лr,Еt,Оy,Зu,Ыi,Эo,Ъp,И[,Я],Жa,Щs,Чd,Бf,Рg,Тh,Пj,Мk,Дl,Ь',Сz,Юx,Уc,Нv,Йb,Фn,Шm,А.,і~,кQ,гW,хE,лR,еT,оY,зU,ыI,эO,ъP,и{,я},жA,щS,чD,бF,рG,тH,пJ,мK,дL,ц:,ь\",юX,уC,нV,йB,фN,шM,в<,а>,В\,,Ц\\;
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl;'zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
" best
    " set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"{{{
"  map ё `
"  map й q
"  map ц w
"  map у e
"  map к r
"  map е t
"  map н y
"  map г u
"  map ш i
"  map щ o
"  map з p
"  map х [
"  map ъ ]
"  map ф a
"  map ы s
"  map в d
"  map а f
"  map п g
"  map р h
"  map о j
"  map л k
"  map д l
"  map ж ;
"  map э '
"  map я z
"  map ч x
"  map с c
"  map м v
"  map и b
"  map т n
"  map ь m
"  map б ,
"  map ю .
"  map Ё ~
"  map Й Q
"  map Ц W
"  map У E
"  map К R
"  map Е T
"  map Н Y
"  map Г U
"  map Ш I
"  map Щ O
"  map З P
"  map Х {
"  map Ъ }
"  map Ф A
"  map Ы S
"  map В D
"  map А F
"  map П G
"  map Р H
"  map О J
"  map Л K
"  map Д L
"  map Ж :
"  map Э "
"  map Я Z
"  map Ч X
"  map С C
"  map М V
"  map И B
"  map Т N
"  map Ь M
"  map Б <
"  map Ю >
"}}}



" set iskeyword=@,48-57,_,192-255 
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
"setlocal spell spelllang=ru_yo,en_us
set spelllang=ru_yo,en_us

" переключение на русскую/английскую раскладку по Alt-Space
""cmap <silent> <A-Space> <C-^>
"imap <silent> <A-Space> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <A-Space> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <A-Space> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
"cmap <silent> <A-f> <C-^>
"imap <silent> <A-f> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <A-f> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <A-f> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
map <A-Space> <C-^>
imap <A-Space> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
map <A-f> <C-^>
imap <A-f> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>

" Переключение раскладок и индикация выбранной в данный момент раскладки -->
" При английской раскладке статусная строка текущего окна будет синего цвета, а при русской - красного
function! MyKeyMapHighlight()
	if &iminsert == 0
		hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
    else
        hi StatusLine ctermfg=DarkRed guifg=DarkRed
    endif
endfunction
" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()
" При изменении активного окна будет выполняться обновление индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()
" <--


set cm=blowfish
set visualbell
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set selectmode=mouse,key
set nobackup
set showcmd
set showmatch
set showmode
" set magic
set esckeys
set incsearch
set mouse=a
set autoindent
set nohlsearch
set hidden
set nowrap
set ignorecase
let g:python_highlight_all = 1
set helplang=en
set noautowrite
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab
set wildchar=<TAB>
set ttyfast
" set splitbelow
set listchars=tab:>-,trail:<,eol:$,extends:>,precedes:<
" set wrap
set virtualedit=block
set tagbsearch
set wildmenu
set wcm=<Tab>
set wildmode=longest,full
set wmh=0
set switchbuf="useopen"
set modelines=0
set clipboard=unnamed
set lazyredraw
set ruler
set statusline=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline=%=%f\ \"%F\"\ %m%R\ [%4l(%3p%%):%3c-(0x%2B),%Y] 
set laststatus=2 " always show the status line

" set keymodel=startsel,stopsel
set viminfo='20,\"500   " read/write a .viminfo file -- limit regs to 500 lines
set history=50          " keep 50 lines of command history

set linebreak
set showbreak=>

set helplang=en


" folding
set foldmethod=marker
"}}}

" select user colorscheme and gui font, if we use gvim"{{{
if has("gui_running")
    " set guifont=Fixed\ Semi-Condensed\ 12
    if has('win32') || has('win64') " has("unix") or mac
        set guifont=Fixedsys:h9:cRUSSIAN
    else
        " set guifont=Terminus\ 10
        " set guifont=Terminus:h14
        set guifont=PragmataPro\ 11
        " set guifont=PragmataPro:h15
    endif

    " set guifont=Liberation\ Mono\ 10
    " set guifont=Fixed\ 12
    set mousehide
    " set guioptions=agiMrL
    " set guioptions=aegimrLtT
    set guioptions=aegimLt
    " colorscheme putty2
    colorscheme hhdyellow2
else
    colorscheme darkocean
endif
let g:mycolors = ['hhdyellow2','wintersday','candy','murphy','asu1dark','af','desert','adrian','darkocean','industry','elflord','evening','koehler']
"" nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(1)<CR>
" nnoremap <C-F8> :call NextColor(1)<CR>
"}}}

" terminal keycodes mappings "{{{
" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" ЧУФБЧЙФШ maptimeout 5 Ч .screenrc
" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

" from suse linux
if &term =~ "xterm"
    let myterm = "xterm"
else
    let myterm =  &term
endif
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

" Here we define the keys of the NumLock in keyboard transmit mode of xterm
" which misses or hasn't activated Alt/NumLock Modifiers.  Often not defined
" within termcap/terminfo and we should map the character printed on the keys.
" if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
"     " keys in insert/command mode.
"     map! <ESC>Oo  :
"     map! <ESC>Oj  *
"     map! <ESC>Om  -
"     map! <ESC>Ok  +
"     map! <ESC>Ol  ,
"     map! <ESC>OM  
"     map! <ESC>Ow  7
"     map! <ESC>Ox  8
"     map! <ESC>Oy  9
"     map! <ESC>Ot  4
"     map! <ESC>Ou  5
"     map! <ESC>Ov  6
"     map! <ESC>Oq  1
"     map! <ESC>Or  2
"     map! <ESC>Os  3
"     map! <ESC>Op  0
"     map! <ESC>On  .
"     " keys in normal mode
"     map <ESC>Oo  :
"     map <ESC>Oj  *
"     map <ESC>Om  -
"     map <ESC>Ok  +
"     map <ESC>Ol  ,
"     map <ESC>OM  
"     map <ESC>Ow  7
"     map <ESC>Ox  8
"     map <ESC>Oy  9
"     map <ESC>Ot  4
"     map <ESC>Ou  5
"     map <ESC>Ov  6
"     map <ESC>Oq  1
"     map <ESC>Or  2
"     map <ESC>Os  3
"     map <ESC>Op  0
"     map <ESC>On  .
" endif

" xterm but without activated keyboard transmit mode
" and therefore not defined in termcap/terminfo.
" if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
"     " keys in insert/command mode.
"     map! <Esc>[H  <Home>
"     map! <Esc>[F  <End>
"     " Home/End: older xterms do not fit termcap/terminfo.
"     map! <Esc>[1~ <Home>
"     map! <Esc>[4~ <End>
"     " Up/Down/Right/Left
"     map! <Esc>[A  <Up>
"     map! <Esc>[B  <Down>
"     map! <Esc>[C  <Right>
"     map! <Esc>[D  <Left>
"     " KP_5 (NumLock off)
"     map! <Esc>[E  <Insert>
"     " PageUp/PageDown
"     map <ESC>[5~ <PageUp>
"     map <ESC>[6~ <PageDown>
"     map <ESC>[5;2~ <PageUp>
"     map <ESC>[6;2~ <PageDown>
"     map <ESC>[5;5~ <PageUp>
"     map <ESC>[6;5~ <PageDown>
"     " keys in normal mode
"     map <ESC>[H  0
"     map <ESC>[F  $
"     " Home/End: older xterms do not fit termcap/terminfo.
"     map <ESC>[1~ 0
"     map <ESC>[4~ $
"     " Up/Down/Right/Left
"     map <ESC>[A  k
"     map <ESC>[B  j
"     map <ESC>[C  l
"     map <ESC>[D  h
"     " KP_5 (NumLock off)
"     map <ESC>[E  i
"     " PageUp/PageDown
"     map <ESC>[5~ 
"     map <ESC>[6~ 
"     map <ESC>[5;2~ 
"     map <ESC>[6;2~ 
"     map <ESC>[5;5~ 
"     map <ESC>[6;5~ 
" endif

" xterm/kvt but with activated keyboard transmit mode.
" Sometimes not or wrong defined within termcap/terminfo.
" if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
"     " keys in insert/command mode.
"     map! <Esc>OH <Home>
"     map! <Esc>OF <End>
"     map! <ESC>O2H <Home>
"     map! <ESC>O2F <End>
"     map! <ESC>O5H <Home>
"     map! <ESC>O5F <End>
"     " Cursor keys which works mostly
"     " map! <Esc>OA <Up>
"     " map! <Esc>OB <Down>
"     " map! <Esc>OC <Right>
"     " map! <Esc>OD <Left>
"     map! <Esc>[2;2~ <Insert>
"     map! <Esc>[3;2~ <Delete>
"     map! <Esc>[2;5~ <Insert>
"     map! <Esc>[3;5~ <Delete>
"     map! <Esc>O2A <PageUp>
"     map! <Esc>O2B <PageDown>
"     map! <Esc>O2C <S-Right>
"     map! <Esc>O2D <S-Left>
"     map! <Esc>O5A <PageUp>
"     map! <Esc>O5B <PageDown>
"     map! <Esc>O5C <S-Right>
"     map! <Esc>O5D <S-Left>
"     " KP_5 (NumLock off)
"     map! <Esc>OE <Insert>
"     " keys in normal mode
"     map <ESC>OH  0
"     map <ESC>OF  $
"     map <ESC>O2H  0
"     map <ESC>O2F  $
"     map <ESC>O5H  0
"     map <ESC>O5F  $
"     " Cursor keys which works mostly
"     " map <ESC>OA  k
"     " map <ESC>OB  j
"     " map <ESC>OD  h
"     " map <ESC>OC  l
"     map <Esc>[2;2~ i
"     map <Esc>[3;2~ x
"     map <Esc>[2;5~ i
"     map <Esc>[3;5~ x
"     map <ESC>O2A  ^B
"     map <ESC>O2B  ^F
"     map <ESC>O2D  b
"     map <ESC>O2C  w
"     map <ESC>O5A  ^B
"     map <ESC>O5B  ^F
"     map <ESC>O5D  b
"     map <ESC>O5C  w
"     " KP_5 (NumLock off)
"     map <ESC>OE  i
" endif

" if myterm == "linux"
"     " keys in insert/command mode.
"     map! <Esc>[G  <Insert>
"     " KP_5 (NumLock off)
"     " keys in normal mode
"     " KP_5 (NumLock off)
"     map <ESC>[G  i
" endif

" This escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC[tm])
" map! <Esc>[3~ <Delete>
" map  <ESC>[3~    x
if myterm == "screen"
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"

    map <Esc>[11~ <F1>
    map <Esc>[12~ <F2>
    map <Esc>[13~ <F3>
    map <Esc>[14~ <F4>
    map <Esc>[15~ <F5>
    map <Esc>[17~ <F6>
    map <Esc>[18~ <F7>
    map <Esc>[19~ <F8>
    map <Esc>[20~ <F9>
    map <Esc>[21~ <F10>
    map <Esc>[23~ <F11>
    map <Esc>[24~ <F12>
    map! <Esc>[11~ <F1>
    map! <Esc>[12~ <F2>
    map! <Esc>[13~ <F3>
    map! <Esc>[14~ <F4>
    map! <Esc>[15~ <F5>
    map! <Esc>[17~ <F6>
    map! <Esc>[18~ <F7>
    map! <Esc>[19~ <F8>
    map! <Esc>[20~ <F9>
    map! <Esc>[21~ <F10>
    map! <Esc>[23~ <F11>
    map! <Esc>[24~ <F12>


    " map! <Esc>[5;3~ <A-PageUp>
    " map! <Esc>[6;3~ <A-PageDown> 
endif
" inoremap <A-PageDown> :bn<cr>
" inoremap <A-PageUp> :bp<cr>

if myterm == "xterm"
    map <Esc>[11~ <F1>
    map <Esc>[12~ <F2>
    map <Esc>[13~ <F3>
    map <Esc>[14~ <F4>
    map <Esc>[15~ <F5>
    map <Esc>[17~ <F6>
    map <Esc>[18~ <F7>
    map <Esc>[19~ <F8>
    map <Esc>[20~ <F9>
    map <Esc>[21~ <F10>
    map <Esc>[23~ <F11>
    map <Esc>[24~ <F12>
    map! <Esc>[11~ <F1>
    map! <Esc>[12~ <F2>
    map! <Esc>[13~ <F3>
    map! <Esc>[14~ <F4>
    map! <Esc>[15~ <F5>
    map! <Esc>[17~ <F6>
    map! <Esc>[18~ <F7>
    map! <Esc>[19~ <F8>
    map! <Esc>[20~ <F9>
    map! <Esc>[21~ <F10>
    map! <Esc>[23~ <F11>
    map! <Esc>[24~ <F12>

    map <Esc>[A <A-Up>
    map <Esc>[B <A-Down>
    map <Esc>[D <A-Left>
    map <Esc>[C <A-Right>
    map! <Esc>[A <A-Up>
    map! <Esc>[B <A-Down>
    map! <Esc>[D <A-Left>
    map! <Esc>[C <A-Right>

    map <Esc>[1;3A <A-Up>
    map <Esc>[1;3B <A-Down>
    map <Esc>[1;3D <A-Left>
    map <Esc>[1;3C <A-Right>
    map! <Esc>[1;3A <A-Up>
    map! <Esc>[1;3B <A-Down>
    map! <Esc>[1;3D <A-Left>
    map! <Esc>[1;3C <A-Right>

    map <Esc>[D <C-Left>
    map! <Esc>[D <C-Left>
    map <Esc>[C <C-Right>
    map! <Esc>[C <C-Right>
    map <Esc>[A <C-Up>
    map! <Esc>[A <C-Up>
    map <Esc>[B <C-Down>
    map! <Esc>[B <C-Down>

    map <Esc>[1;5D <C-Left>
    map! <Esc>[1;5D <C-Left>
    map <Esc>[1;5C <C-Right>
    map! <Esc>[1;5C <C-Right>
    map <Esc>[1;5A <C-Up>
    map! <Esc>[1;5A <C-Up>
    map <Esc>[1;5B <C-Down>
    map! <Esc>[1;5B <C-Down>

    map <Esc>[1;2D <S-Left>
    map! <Esc>[1;2D <S-Left>
    map <Esc>[1;2C <S-Right>
    map! <Esc>[1;2C <S-Right>
    map <Esc>[1;2A <S-Up>
    map! <Esc>[1;2A <S-Up>
    map <Esc>[1;2B <S-Down>
    map! <Esc>[1;2B <S-Down>

    map <Esc>[1;5H <C-Home>
    map! <Esc>[1;5H <C-Home>
    map <Esc>[1;5F <C-End>
    map! <Esc>[1;5F <C-End>

    map <M-Esc>[62~ <MouseDown>
    map! <M-Esc>[62~ <MouseDown>
    map <M-Esc>[63~ <MouseUp>
    map! <M-Esc>[63~ <MouseUp>
    map <M-Esc>[64~ <S-MouseDown>
    map! <M-Esc>[64~ <S-MouseDown>
    map <M-Esc>[65~ <S-MouseUp>
    map! <M-Esc>[65~ <S-MouseUp>

    map <Esc>[11^ <C-F1>
    " map <Esc>5P <C-F1>
    " map! <Esc>[1;5P <C-F1>
    map <Esc>[1;5Q <C-F2>
    map! <Esc>[1;5Q <C-F2>
    map <Esc>[1;5R <C-F3>
    map! <Esc>[1;5R <C-F3>
    map <Esc>[1;5S <C-F4>
    map! <Esc>[1;5S <C-F4>
    
endif

"}}}

" plugins settings 

"Calendar plugin"{{{

let g:calendar_monday = 1
let g:calendar_weeknm = 1 " WK01
" let g:calendar_wruler = 'Mo Tu We Th Fr Sa Su'

"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
"let g:calendar_week_number=1
"let g:calendar_cyclic_view =1
""let g:calendar_view = "{day}"
"let g:calendar_view = "{year/month/week/days/day/clock}"
""}}}
" yankring"{{{
    " let g:loaded_yankring = 1
    let g:yankstack_map_keys = 1
    let g:yankring_enabled = 1
    let g:yankring_persist = 0
    let g:yankring_history_dir = '$HOME/.vim'
    let g:yankring_history_file = 'yrh'
    nnoremap <silent> <C-p> :YRShow<CR>
    nnoremap <silent> <Leader>p :YRShow<CR>
"}}}

"vim-sneak {{{
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S

"}}}

" Minibufexpl plugin settings"{{{
let g:loaded_minibufexplorer = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplSplitBelow=0
let g:miniBufExplMaxSize = 2
let g:miniBufExplMinSize = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplForceSyntaxEnable = 1"}}}
" Enchanced commentify plugin settings"{{{
" let g:EnhCommentifyUseAltKeys = 'No'
" let g:EnhCommentifyBindInNormal = 'No'
" let g:EnhCommentifyBindInInsert = 'No'
" let g:EnhCommentifyBindInVisual = 'No'
" let g:EnhCommentifyFirstLineMode = 'Yes'
" " let g:EnhCommentifyTraditionalMode = 'No'
" let g:EnhCommentifyPretty = 'Yes'
" let g:EnhCommentifyRespectIndent = 'Yes'
" " let g:EnhCommentifyUserBindings = 'Yes'
" vmap <F4> <Plug>VisualFirstLine<CR>
" nmap <F4> <Plug>FirstLine
" imap <F4> <Esc><Plug>FirstLineli
" }}}

" NerdCommenter plugin: {{{
" https://github.com/scrooloose/nerdcommenteDComToggleComment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = {
        \ 'CONF': { 'left': '#', 'leftAlt': '', 'rightAlt': '' }
    \ }

"  Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

vmap <F4> <Plug>NERDCommenterToggle
nmap <F4> <Plug>NERDCommenterToggle
imap <F4> <Plug>NERDCommenterToggle

autocmd BufEnter * :call SetFiletypeNewBuffer()
function! SetFiletypeNewBuffer()
  if @% == ""
    :set filetype=CONF
  endif
endfunction

"}}}

" Autoenc plugin settings https://github.com/s3rvac/AutoFenc {{{
let g:autofenc_enable=1
let g:autofenc_emit_messages=1
let g:autofenc_autodetect_bom=1

"}}}
" grep plugin settings"{{{
let Grep_Default_Options = '-i'
let Grep_Skip_Files = '*.bak *.pyo *.pyc *.o *~ *,v tags'
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn db'
"let Grep_Default_Filelist = '*.c *.cpp *.asm'
let Grep_Default_Filelist = '*'"}}}
" project plugin settings"{{{
let g:proj_flags="ist""}}}
" VIM-Shell"{{{
" Ctrl_W e opens up a vimshell in a horizontally split window
" Ctrl_W E opens up a vimshell in a vertically split window
" The shell window will be auto closed after termination
nmap <C-W>e :new \| vimshell bash<CR>
nmap <C-W>E :vnew \| vimshell bash<CR>"}}}
" Most Recently Used plugin"{{{
" let MRU_File = '/home/stalker/.vim/mrufiles'
let MRU_Max_Entries = 30
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
" let MRU_Window_Height = 15
" let MRU_Use_Current_Window = 1
" let MRU_Auto_Close = 0
"}}}  
"dbext plugin"{{{
    let g:dbext_default_type   = 'PGSQL'
    let g:dbext_default_user   = 'postgres'
    let g:dbext_default_dbname = 'netflow'
"}}}
"VCSCommand plugin"{{{
let g:VCSCommandVCSType='SVN'
let g:VCSCommandMapPrefix='<Leader>s'				
"}}}
"Plugin Python-mode"{{{

let g:pymode_indent = 0
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 999
let g:pymode_options_colorcolumn = 0

" let g:pymode_lint_ignore = "C901"
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_rope = 0
"}}}

"Plugin Orgmode" {{{
" https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt
let g:org_indent = 1
let g:org_heading_shade_leading_stars = 1

"}}}
" Vim-sneak Plugin: https://github.com/justinmk/vim-sneak"{{{
let g:sneak#label = 1  
  
"}}}
  
" EasyMotion Plugin: https://github.com/easymotion/vim-easymotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_keys = 'ASDFGHJKLCVNM'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_inc_highlight = 1
let g:EasyMotion_do_shade = 1
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

" Colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionMoveHL ErrorMsg
hi link EasyMotionIncSearch ErrorMsg

nmap <Leader><Leader> <Plug>(easymotion-overwin-w)
" nmap <Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader>l <Plug>(easymotion-bd-jk)
xmap <Leader>l <Plug>(easymotion-bd-jk)
omap <Leader>l <Plug>(easymotion-bd-jk)

"}}}

" user autocommands "{{{
if has("autocmd")
    if has("gui_macvim")
        autocmd VimLeave * macaction terminate:
    endif
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " remap default python bindings when editing python scripts
  " au FileType python source "c:\\Program Files (x86)\\vim\\scripts\\python.vim"
  " au FileType python source "~/.vim/scripts/python.vim"

  " if we are call "svn commit" in shell, then highlight subversion output
  " au BufRead svn-commit.tmp source ~/.vim/scripts/svn-diff.vim

  au BufNewFile,BufRead  svn-commit.* setf svn
  au BufNewFile,BufRead  svn-log.* setf svn

  " always cd to the current file's directory
  " autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | sil! lcd %:p:h | endif
  autocmd BufEnter * silent! lcd %:p:h
  " autocmd BufEnter * lcd %:p:h

  " http://vim.wikia.com/wiki/Open_every_buffer_in_its_own_tabpage
  " au BufNewFile,BufRead * nested
  "   \ if &buftype != "help" |
  "   \   tab sball |
  "   \ endif

endif " has("autocmd")
 "}}}

" base keys remapping "{{{

" remap space in normal mode to open/close folds
" nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

" remap C-U in insert mode to make undo
inoremap <C-u> <Esc>ui
" remap C-R in insert mode to make redo
" map jk in insert to esc
" inoremap jk <esc>l
" inoremap kj <esc>l
" inoremap <C-r> <Esc><C-R>i
" do not go to start selection after yank text
vnoremap y y<CR>`]
" remap Ctrl-w sequence in insert mode to normal mode behavior
" inoremap <C-w> <C-o><C-w>
" remap C-y in insert mode to delete current string
" inoremap <C-y> <Esc>ddi
" avtoinsert matching braces
" imap ( ()<Left>
" imap [ []<Left>
" imap { {}<Left>
" imap " <C-V>"<C-V>"<Left>

" complete filenames
" inoremap <C-F> <C-X><C-F>

inoremap <M-,> <C-c>lbdwi
inoremap <M-.> <C-c>ldwi
inoremap <M-;> <C-c>lBdWi
inoremap <M-'> <C-c>ldWi
" map <Cr> mpo<esc>`p
" map <M-Cr> mpO<esc>`p

"}}}

" user key mappings "{{{

command! GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen


" goto window at up/down/left/right by Alt+Arrows: "{{{
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-k> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-j> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-h> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
map <silent> <A-l> :wincmd l<CR>
imap <silent> <A-Up> <ESC>:wincmd k<CR>i
imap <silent> <A-k> <ESC>:wincmd k<CR>i
imap <silent> <A-Down> <ESC>:wincmd j<CR>i
imap <silent> <A-j> <ESC>:wincmd j<CR>i
imap <silent> <A-Left> <ESC>:wincmd h<CR>i
imap <silent> <A-h> <ESC>:wincmd h<CR>i
imap <silent> <A-Right> <ESC>:wincmd l<CR>i
imap <silent> <A-l> <ESC>:wincmd l<CR>i
"}}}
" Ctrl+Left/Right -- goto left/right word "{{{
nmap <silent> <C-Left> b
vmap <silent> <C-Left> b
imap <silent> <C-Left> <Esc>lbi
nmap <silent> <C-Right> w
vmap <silent> <C-Right> w
imap <silent> <C-Right> <Esc>lwi
"}}}
" Shift+Left/Right -- goto left/right WORD"{{{
map <silent> <S-Left> B
vmap <silent> <S-Left> B
imap <silent> <S-Left> <Esc>lBi
map <silent> <S-Right> W
vmap <silent> <S-Right> W
imap <silent> <S-Right> <Esc>lWi
"}}}
" Ctrl+Up/Dn -- switch to previous/next buffer"{{{
map <silent> <C-Up> :bp<CR>zz
imap <silent> <C-Up> <Esc>:bp<CR>zzi
map <silent> <C-Down> :bn<CR>zz
imap <silent> <C-Down> <Esc>:bn<CR>zzi
"}}}
" Shift+Up/Down -- goto first character at up/down line "{{{
map <silent> <S-Up> -
imap <silent> <S-Up> <Esc>-i
map <silent> <S-Down> +
imap <silent> <S-Down> <Esc>+i
"}}}
"Go to first/last file line by pressing Ctrl+Home/End"{{{
map <silent> <C-Home> 1G0
imap <silent> <C-Home> <Esc>1G0i
map <silent> <C-End> G0
imap <silent> <C-End> <Esc>G0i
"}}}
" increment visually selected block of numbers "{{{
function! Incr()
    let l  = line(".")
    let c  = virtcol("'<")
    let l1 = line("'<")
    let l2 = line("'>")
    if l1 > l2
        let a = l - l2
    else
        let a = l - l1
    endif
    if a != 0
        exe 'normal '.c.'|'
        exe 'normal '.a."\<c-a>"
    endif
    normal `<
endfunction

vnoremap <c-a> :call Incr()<cr>
"}}}


nmap <Tab> za
map <Leader>h <C-w><C-w>
map <Leader>k :bd<CR>
map <Leader>o :Occur<CR>
" map <buffer> <silent> <Space> x

" create mappings for quick access to frequently used files"{{{
" map <Leader>v :e ~/.vimrc<CR>
" autocmd! bufwritepost .vimrc source %
" autocmd! bufwritepost _vimrc source %
" map <Leader>i :e ~/notes/index.txt<CR>
" map <Leader>t :e ~/notes/todo.txt<CR>
" map <Leader>m :e ~/notes/memo.txt<CR>
" map <Leader>c :e ~/notes/work_contacts.txt<CR>
"}}}

" map F2 key to save in all modes
imap <F2> <C-O>:w!<CR>
map <F2> :w!<CR>
" vmap <F2> :w! ~/.vim/clipboard<CR>
vmap <F2> "*ygv
imap <C-s> <C-O>:w!<CR>
map <C-s> :w!<CR>

" map F3 key to make selection in all modes
imap <F3> <C-c><F3>
map <silent> <F3> V
nnoremap <silent> <F3> V
vmap <F3> <C-c>

" python helper
" map  <F4> :call ShowPyDoc('<C-R><C-W>', 1)<CR>
" map  <F5> :call ShowPyDoc('<C-R><C-A>', 1)<CR>

" make a visual selection of the lines that have the same indent level or more as the current line "{{{
" function! SelectIndent ()
    " let temp_var=indent(line("."))
    " while indent(line(".")-1) >= temp_var
        " exe "normal h"
    " endwhile 
    " exe "normal V"
    " while indent(line(".")+1) >= temp_var
        " exe "normal j"
    " endwhile
" endfun
" nmap <space> :call SelectIndent()<cr>
"}}}

" ExecuteScript "{{{
function! ExecuteScript(mode)
    let tempscript="~/temp/tempscript"
    let myfiletype=&filetype
    if has('win32') || has('win64')
        let tempscript="c:\\temp\\tempscript"
    endif
    let curr_scr = expand("%:p")
    
    " echo myfiletype
    if myfiletype == "PYTHON"
        let mycommand = "silent 0r !python " . tempscript
        if has('win32') || has('win64')
            " let mycommand = "silent 0r !c:\Program Files (x86)\\Python 2.7\python.exe'" . tempscript
            let mycommand = "silent 0r !c:\python3\python.exe'" . tempscript
        endif
    elseif myfiletype == "PS1"
        " set fileencoding=cp866
        let tempscript = curr_scr
        let mycommand = "silent 0r ++enc=cp866 !powershell.exe -ExecutionPolicy Unrestricted -File " . curr_scr
    elseif myfiletype == "VB"
        " set fileencoding=cp866
        let tempscript = tempscript . ".vbs"
        let mycommand = "silent 0r ++enc=cp866 !c:\\windows\\system32\\cscript.exe " . curr_scr . " //nologo"
    elseif myfiletype == "shell"
        let mycommand = "silent 0r !bash " . tempscript
    elseif myfiletype == "postgres"
        let mycommand = "silent 0r !psql -U postgres netflow -f " . tempscript
    endif

    if a:mode != "visual"
        let mywrcommand = "1,$w! " . tempscript
    else " we are in visual mode
        let mywrcommand = "'<,'>w! " . tempscript
    endif
    " echom mywrcommand
    silent execute mywrcommand
    " echom mycommand

    " set splitbelow
    set nosplitbelow
    set splitright
    " if myfiletype == "postgres"
        vnew
    " else
        " 15new
    " endif
    " set nosplitbelow
    map <buffer> <silent> f <C-W>o
    map <buffer> <silent> q :bd!<CR>
    map <buffer> <silent> <cr> :bd!<CR>
    " set noswapfile
    set wrap
    echom mycommand
    " echom v:scrollstart
    silent execute mycommand
    execute "normal gg"
endfunction

nmap <F5> :call ExecuteScript("normal")<cr>
imap <F5> <C-C>:call ExecuteScript("normal")<cr>
vmap <F5> :call ExecuteScript("visual")<cr>
"}}}

" create improvised clipboard for all vim instances for same user "{{{
" vnoremap <F5> :w! ~/.vim/clipboard<CR>i
" vnoremap <S-F5> :w!>> ~/.vim/clipboard<CR>i
" nnoremap <F5> :r ~/.vim/clipboard<CR>
" inoremap <F5> <Esc>k:r ~/.vim/clipboard<CR>i
 " }}}

" map F6 key to call Project plugin
map <silent> <F6> <Plug>ToggleProject

" map F7 key to call improvised shell plugin
" map  <F7> :source /home/stalker/.vim/scripts/vimsh.vim<CR>

" user menu. Called by pressing F7"{{{
menu Utilites.windows-1251    :e ++enc=cp1251<CR>
menu Utilites.ibm-866         :e ++enc=ibm866<CR>
menu Utilites.utf-8           :e ++enc=utf-8 <CR>
menu Utilites.ucs-bom           :e ++enc=ucs-bom <CR>
menu Utilites.ucs-2le           :e ++enc=ucs-2le <CR>
menu Utilites.koi8-r          :e ++enc=koi8-r<CR>
menu Utilites.Grep            :Grep<CR>
menu Utilites.Recursive_Grep  :Rgrep<CR>
menu Utilites.GrepBuffer      :GrepBuffer<CR>
menu Utilites.Fgrep           :Fgrep<CR>
menu Utilites.Recursive_fgrep :Rfgrep<CR>
menu Utilites.Egrep           :Egrep<CR>
menu Utilites.Recursive_egrep :Regrep<CR>
menu Utilites.Agrep           :Agrep<CR>
menu Utilites.Recursive_agrep :Ragrep<CR>
map <F7> :emenu Utilites.<TAB>
"}}}

" map F8 key to ESC
" map <F8> <Esc>
" map! <F8> <Esc>
" map <F8> <C-c>
" map! <F8> <C-c>
nnoremap <silent> <F8> :NERDTreeToggle<CR>
map! <F8> :NERDTree<CR>
"" nnoremap <F8> :call NextColor(1)<CR>
"nnoremap <S-F8> :call NextColor(-1)<CR>
"nnoremap <A-F8> :call NextColor(1)<CR>


" nnoremap <silent> <F8> :MBEToggle<CR>

" map F9 key to call vimcommander
" noremap <silent> <F11> :cal VimCommanderToggle()<CR>
nnoremap <silent> <F9> :cal VimCommanderToggle()<CR>
nnoremap <silent> <F11> :NERDTreeToggle<CR>

" map F10 key to quit from vim without saving all open buffers
imap <F10> <Esc>:qa!<CR>
map <F10> :qa!<CR>

" map F11 key to refresh tags in TagList window
" nnoremap <silent> <F11> :TlistUpdate<CR>
" map F12 key to call TagList window
nnoremap <silent> <F12> :Tlist<CR>

" map <silent> <F12> :bd!<CR>
" map! <silent> <F12> :bd!<CR>

"}}}

" User abbreviatures "{{{
" iab _pystart #!/usr/bin/env python<CR># -*- coding: koi8-r -*-
iab _pystart #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR><CR>import sys<CR>reload(sys)<CR>sys.setdefaultencoding('utf-8')<CR><CR>def main():<CR><tab>if __name__ == "__main__":<CR><tab>main()
"}}}




