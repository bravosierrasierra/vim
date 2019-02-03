" Vim color file {{{1
"  Maintainer: hira@users.sourceforge.jp
" Last Change: 2003/11/08 (Sat) 15:09:19.
"     Version: 1.3
" This color scheme uses a dark background.

" Options
" format:
"        hhcs_<gui|cterm|both>_<theme|all>_<target>="value"
" target:
"    linenr
"        "light"      : NONE, fg=black,        bg=light<theme>
"        "dark"       : NONE, fg=black,        bg=dark<theme>
"        "normal"     : none,      fg=light<theme>, bg=black
"    nontext
"        "NONEd" : NONE, fg=dark<theme>,  bg=black
"        "normal"     : none,      fg=dark<theme>,  bg=black
"    
"        This is original settings.
"            :let hhcs_both_all_linenr  ="light"
"            :let hhcs_both_all_nontext ="NONEd"
"    
"        This is prototype settings.
"            :let hhcs_both_all_linenr  ="dark"
"            :let hhcs_both_all_nontext ="NONEd"
"    
"        If you don't want to eccentric feature, try this.
"            :let hhcs_both_all_linenr  ="normal"
"            :let hhcs_both_all_nontext ="normal"
"
"        Normal, except hhdgray(gui), hhdgreen(cterm).
"            :let hhcs_both_all_linenr        ="normal"
"            :let hhcs_both_all_nontext       ="normal"
"            :let hhcs_gui_hhdgray_linenr     ="light"
"            :let hhcs_gui_hhdgray_nontext    ="NONEd"
"            :let hhcs_cterm_hhdgreen_linenr  ="dark"
"            :let hhcs_cterm_hhdgreen_nontext ="NONEd"
"
"        For poor cterm
"            :let hhcs_cterm_all_linenr     ="normal"

" Happy Hacking color scheme ((DARK)) {{{1
set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif
let colors_name       = expand("<sfile>:t:r")
let html_my_rendering = 1


" frame & title & message (theme) {{{1
hi NonText                   gui=NONE   guifg=darkyellow     guibg=black
hi NonText                 cterm=NONE ctermfg=darkyellow   ctermbg=black
hi Folded                    gui=NONE        guifg=darkyellow     guibg=black
hi Folded                  cterm=NONE      ctermfg=darkyellow   ctermbg=black
hi FoldColumn                gui=NONE        guifg=darkyellow     guibg=black
hi FoldColumn              cterm=NONE      ctermfg=darkyellow   ctermbg=black
hi StatusLineNC              gui=NONE   guifg=black          guibg=darkyellow
hi StatusLineNC              gui=NONE ctermfg=black        ctermbg=darkyellow
hi LineNr                    gui=NONE        guifg=lightyellow    guibg=black
hi LineNr                  cterm=NONE      ctermfg=lightyellow  ctermbg=black
hi LineNr                    gui=NONE   guifg=black          guibg=lightyellow
hi LineNr                  cterm=NONE ctermfg=black        ctermbg=lightyellow
hi VertSplit                 gui=NONE        guifg=darkyellow     guibg=darkyellow
hi VertSplit               cterm=NONE      ctermfg=darkyellow   ctermbg=darkyellow
" title
" hi Title                     gui=NONE   guifg=lightgray      guibg=darkyellow
" hi Title                   cterm=NONE ctermfg=lightgray    ctermbg=darkyellow
hi Title                     gui=NONE   guifg=black      guibg=darkyellow
hi Title                   cterm=NONE ctermfg=black    ctermbg=darkyellow
" message
hi MoreMsg                   gui=NONE   guifg=black          guibg=darkyellow
hi MoreMsg                 cterm=NONE ctermfg=black        ctermbg=darkyellow
hi Question                  gui=NONE   guifg=black          guibg=darkyellow
hi Question                cterm=NONE ctermfg=black        ctermbg=darkyellow


" cursor {{{1
hi StatusLine                gui=NONE   guifg=black          guibg=gray
hi StatusLine              cterm=NONE ctermfg=black        ctermbg=gray
hi WildMenu                  gui=NONE   guifg=black          guibg=green
hi WildMenu                cterm=NONE ctermfg=black        ctermbg=green
hi Cursor                    gui=NONE   guifg=black          guibg=green
hi Cursor                  cterm=NONE ctermfg=black        ctermbg=green
hi IncSearch                 gui=NONE   guifg=black          guibg=green
hi IncSearch               cterm=NONE ctermfg=black        ctermbg=green
hi CursorIM                  gui=NONE   guifg=black          guibg=green
hi CursorIM                cterm=NONE ctermfg=black        ctermbg=green
hi Search                    gui=NONE   guifg=black          guibg=yellow
hi Search                  cterm=NONE ctermfg=black        ctermbg=yellow
hi Visual                    gui=NONE   guifg=black          guibg=gray
hi Visual                  cterm=NONE ctermfg=black        ctermbg=gray


" message {{{1
hi ErrorMsg                  gui=NONE   guifg=black          guibg=red
hi ErrorMsg                cterm=NONE ctermfg=black        ctermbg=red
hi WarningMsg                gui=NONE   guifg=black          guibg=yellow
hi WarningMsg              cterm=NONE ctermfg=black        ctermbg=yellow
hi ModeMsg                   gui=NONE   guifg=black          guibg=green
hi ModeMsg                 cterm=NONE ctermfg=black        ctermbg=green


" inner {{{1
hi Normal                    gui=NONE        guifg=lightgray      guibg=black
hi Normal                  cterm=NONE      ctermfg=lightgray    ctermbg=black
hi Ignore                    gui=NONE        guifg=black          guibg=black
hi Ignore                  cterm=NONE      ctermfg=black        ctermbg=black
hi Todo                      gui=NONE   guifg=black          guibg=red
hi Todo                    cterm=NONE ctermfg=black        ctermbg=red
hi Error                     gui=NONE   guifg=lightgray      guibg=red
hi Error                   cterm=NONE ctermfg=lightgray    ctermbg=red
hi Special                   gui=NONE        guifg=lightcyan      guibg=black
hi Special                 cterm=NONE      ctermfg=lightcyan    ctermbg=black
hi SpecialKey                gui=NONE        guifg=cyan           guibg=black
hi SpecialKey              cterm=NONE      ctermfg=cyan         ctermbg=black
hi Identifier                gui=NONE        guifg=cyan           guibg=black
hi Identifier              cterm=NONE      ctermfg=cyan         ctermbg=black
hi Constant                  gui=NONE        guifg=lightred       guibg=black
hi Constant                cterm=NONE      ctermfg=lightred     ctermbg=black
hi Statement                 gui=NONE        guifg=lightyellow    guibg=black
hi Statement               cterm=NONE      ctermfg=lightyellow  ctermbg=black
hi Comment                   gui=NONE        guifg=lightblue      guibg=black
hi Comment                 cterm=NONE      ctermfg=lightblue    ctermbg=black
hi NONEd                gui=NONE   guifg=lightblue      guibg=black
hi NONEd              cterm=NONE ctermfg=lightblue    ctermbg=black
hi Directory                 gui=NONE        guifg=lightgreen     guibg=black
hi Directory               cterm=NONE      ctermfg=lightgreen   ctermbg=black
hi PreProc                   gui=NONE        guifg=lightmagenta   guibg=black
hi PreProc                 cterm=NONE      ctermfg=lightmagenta ctermbg=black
hi Type                      gui=NONE        guifg=lightgreen     guibg=black
hi Type                    cterm=NONE      ctermfg=lightgreen   ctermbg=black


" option {{{1
function! s:SetOpt(term, theme, target, default)
    let s:opt_{a:term}_{a:target}
    \    = exists("g:hhcs_".a:term."_".a:theme."_".a:target)
    \        ? g:hhcs_{a:term}_{a:theme}_{a:target}
    \    : exists("g:hhcs_".a:term."_all_".a:target)
    \        ? g:hhcs_{a:term}_all_{a:target}
    \    : exists("g:hhcs_both_all_".a:target)
    \        ? g:hhcs_both_all_{a:target}
    \        : a:default
endfunction


" LineNr {{{2
" light, dark, normal
call s:SetOpt(  "gui", "hhdyellow", "linenr", "light")
call s:SetOpt("cterm", "hhdyellow", "linenr", "light")
"echo "s:opt_gui_linenr=".s:opt_gui_linenr
if s:opt_gui_linenr == "light"
    hi LineNr gui=NONE guifg=black guibg=lightyellow
elseif s:opt_gui_linenr == "dark"
    hi LineNr gui=NONE guifg=black guibg=darkyellow
else
    hi LineNr gui=NONE guifg=lightyellow guibg=black
endif
"echo "s:opt_cterm_linenr=".s:opt_cterm_linenr
if s:opt_cterm_linenr == "light"
    hi LineNr cterm=NONE ctermfg=black ctermbg=lightyellow
elseif s:opt_gui_linenr == "dark"
    hi LineNr cterm=NONE ctermfg=black ctermbg=darkyellow
else
    hi LineNr cterm=NONE ctermfg=lightyellow ctermbg=black
endif


" NonText {{{2
" NONEd, normal
call s:SetOpt(  "gui", "hhdyellow", "nontext", "NONEd")
call s:SetOpt("cterm", "hhdyellow", "nontext", "NONEd")
"echo "s:opt_gui_nontext=".s:opt_gui_nontext
if s:opt_gui_nontext == "NONEd"
    hi NonText gui=NONE guifg=darkyellow guibg=black
else
    hi NonText gui=NONE guifg=darkyellow guibg=black
endif
"echo "s:opt_cterm_nontext=".s:opt_cterm_nontext
if s:opt_cterm_nontext == "NONEd"
    hi NonText cterm=NONE ctermfg=darkyellow ctermbg=black
else
    hi NonText cterm=NONE ctermfg=darkyellow ctermbg=black
endif


" 2}}}
" diff {{{1
hi DiffText                  gui=NONE   guifg=black          guibg=red
hi DiffText                cterm=NONE ctermfg=black        ctermbg=red
hi DiffChange                gui=NONE   guifg=black          guibg=lightgray
hi DiffChange              cterm=NONE ctermfg=black        ctermbg=lightgray
hi DiffDelete                gui=NONE        guifg=black          guibg=blue
hi DiffDelete              cterm=NONE      ctermfg=black        ctermbg=blue
hi DiffAdd                   gui=NONE   guifg=black          guibg=cyan
hi DiffAdd                 cterm=NONE ctermfg=black        ctermbg=cyan


" html {{{1
hi htmlLink                  gui=NONE   guifg=lightblue      guibg=black
hi htmlLink                cterm=NONE ctermfg=lightblue    ctermbg=black
hi htmlBold                  gui=NONE   guifg=black          guibg=lightred
hi htmlBold                cterm=NONE ctermfg=black        ctermbg=lightred
hi htmlItalic                gui=NONE   guifg=black          guibg=lightgreen
hi htmlItalic              cterm=NONE ctermfg=black        ctermbg=lightgreen
hi htmlBoldItalic            gui=NONE   guifg=black          guibg=lightblue 
hi htmlBoldItalic          cterm=NONE ctermfg=black        ctermbg=lightblue 
hi htmlNONE             gui=NONE   guifg=lightgray      guibg=black
hi htmlNONE           cterm=NONE ctermfg=lightgray    ctermbg=black
hi htmlBoldNONE         gui=NONE   guifg=lightred       guibg=black
hi htmlBoldNONE       cterm=NONE ctermfg=lightred     ctermbg=black
hi htmlNONEItalic       gui=NONE   guifg=lightgreen     guibg=black
hi htmlNONEItalic     cterm=NONE ctermfg=lightgreen   ctermbg=black
hi htmlBoldNONEItalic   gui=NONE   guifg=lightblue      guibg=black
hi htmlBoldNONEItalic cterm=NONE ctermfg=lightblue    ctermbg=black


" colors{{{1
"     1	black
"     2	blue
"     3	cyan
"     4	darkyellow
"     5	gray
"     6	green
"     7	lightblue
"     8	lightcyan
"     9	lightgray
"    10	lightgreen
"    11	lightmagenta
"    12	lightred
"    13	lightyellow
"    14	red
"    15	yellow
"}}}1
" vim:set nowrap foldmethod=marker expandtab:
