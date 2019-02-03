" -*- vim -*-
" FILE: python.vim
" LAST MODIFICATION: 2003/07/25 19:00
" (C) Copyright 2001-2003 Mikael Berthe <mikael.b@netcourrier.com>
" Version: 1.7

" USAGE:
"
" Just source this script when editing Python files.
" Example: au FileType python source ~me/.vim/scripts/python.vim
" You can set the global variable "g:py_select_leading_comments" to 0
" if you don't want to select comments preceding a declaration (these
" are usually the description of the function/class).
" You can set the global variable "g:py_select_trailing_comments" to 0
" if you don't want to select comments at the end of a function/class.
" If these variables are not defined, both leading and trailing comments
" are selected.
" Example: (in your .vimrc) "let g:py_select_leading_comments = 0"
" You may want to take a look at the 'shiftwidth' option for the
" shift commands...
"
" REQUIREMENTS:
" vim (>= 6)
"
" Shortcuts:
"   [[      -- Jump to beginning of block
"   ]]      -- Jump to end of block
"   ]v      -- Select (Visual Line Mode) block
"   ]<      -- Shift block to left
"   ]>      -- Shift block to right
"   ]c      -- Select current/previous class
"   ]f      -- Select current/previous function
"   ]<up>   -- Jump to previous line with the same/lower indentation
"   ]<down> -- Jump to next line with the same/lower indentation


map  [[   :PBoB<CR>
vmap [[   :<C-U>PBoB<CR>m'gv``
map  ]]   :PEoB<CR>
vmap ]]   :<C-U>PEoB<CR>m'gv``

map  ]v   [[V]]
"map  ]<   [[V]]<
"vmap ]<   <
"map  ]>   [[V]]>
"vmap ]>   >

map  ]c   :call PythonSelectObject("class")<CR>
map  ]f   :call PythonSelectObject("function")<CR>

:com! PBoB execute "normal ".PythonBoB(line('.'), -1, 1)."G"
:com! PEoB execute "normal ".PythonBoB(line('.'), 1, 1)."G"

" Go to a block boundary (-1: previous, 1: next)
" If force_sel_comments is true, 'g:py_select_trailing_comments' is ignored
function! PythonBoB(line, direction, force_sel_comments)
  let ln = a:line
  let ind = indent(ln)
  let mark = ln
  let indent_valid = strlen(getline(ln))
  let ln = ln + a:direction
  if (a:direction == 1) && (!a:force_sel_comments) && 
      \ exists("g:py_select_trailing_comments") && 
      \ (!g:py_select_trailing_comments)
    let sel_comments = 0
  else
    let sel_comments = 1
  endif

  while((ln >= 1) && (ln <= line('$')))
    if  (sel_comments) || (match(getline(ln), "^\\s*#") == -1)
      if (!indent_valid)
        let indent_valid = strlen(getline(ln))
        let ind = indent(ln)
        let mark = ln
      else
        if (strlen(getline(ln)))
          if (indent(ln) < ind)
            break
          endif
          let mark = ln
        endif
      endif
    endif
    let ln = ln + a:direction
  endwhile

  return mark
endfunction


" Go to previous (-1) or next (1) class/function definition
function! PythonDec(obj, direction)
  if (a:obj == "class")
    let objregexp = "^\\s*class\\s\\+[a-zA-Z0-9_]\\+"
        \ . "\\s*\\((\\([a-zA-Z0-9_,. \\t\\n]\\)*)\\)\\=\\s*:"
  else
    let objregexp = "^\\s*def\\s\\+[a-zA-Z0-9_]\\+\\s*(\\_[^:#]*)\\s*:"
  endif
  let flag = "W"
  if (a:direction == -1)
    let flag = flag."b"
  endif
  let res = search(objregexp, flag)
endfunction

" Select an object ("class"/"function")
function! PythonSelectObject(obj)
  " Go to the object declaration
  normal $
  call PythonDec(a:obj, -1)
  let beg = line('.')

  if !exists("g:py_select_leading_comments") || (g:py_select_leading_comments)
    let decind = indent(beg)
    let cl = beg
    while (cl>1)
      let cl = cl - 1
      if (indent(cl) == decind) && (getline(cl)[decind] == "#")
        let beg = cl
      else
        break
      endif
    endwhile
  endif

  if (a:obj == "class")
    let eod = "\\(^\\s*class\\s\\+[a-zA-Z0-9_]\\+\\s*"
            \ . "\\((\\([a-zA-Z0-9_,. \\t\\n]\\)*)\\)\\=\\s*\\)\\@<=:"
  else
   let eod = "\\(^\\s*def\\s\\+[a-zA-Z0-9_]\\+\\s*(\\_[^:#]*)\\s*\\)\\@<=:"
  endif
  " Look for the end of the declaration (not always the same line!)
  call search(eod, "")

  " Is it a one-line definition?
  if match(getline('.'), "^\\s*\\(#.*\\)\\=$", col('.')) == -1
    let cl = line('.')
    execute ":".beg
    execute "normal V".cl."G"
  else
    " Select the whole block
    execute "normal \<Down>"
    let cl = line('.')
    execute ":".beg
    execute "normal V".PythonBoB(cl, 1, 0)."G"
  endif
endfunction

" vim:set et sts=2 sw=2:

