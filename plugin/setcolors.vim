" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let g:mycolors = ['adrian','asu1dark','af','wintersday','candy','hhdyellow','murphy','desert','darkocean','industry','elflord','evening','koehler']
" let g:mycolors = ['slate', 'torte', 'darkblue', 'delek', 'murphy', 'elflord', 'pablo', 'koehler']  " colorscheme names that we use to set color
" let g:mycolors = ['adam','adaryn','adrian','af','aiseered','aqua','astronaut','asu1dark','automation','autumn','autumn2','autumnleaf','billw','biogoo','black_angus','blackbeauty','blackdust','blacksea','blue','bluegreen','blugrine','bmichaelsen','bog','borland','breeze','brookstream','brown','buttercream','bw','c','camo','candy','caramel','chela_light','chocolateliquor','cleanphp','coffee','colorer','cool','dante']
" let g:mycolors = ['darkblack','darkblue','darkblue2','darkdot','darkocean','darkslategray','dawn','default','delek','denim','desert','dusk','earth','edo_sea','elflord','emacs','evening','fine_blue','fnaqevan','fog','fruit','gobo','golden','gor','gothic','greyblue','hhazure','hhdblue','hhdcyan','hhdgray','hhdgreen','hhdmagenta','hhdred','hhdyellow','hhorange']
" let g:mycolors = ['hhpink','hhspring','hhteal','hhviolet','ibmedit','inkpot','ironman','jhdark','jhlight','koehler','less','lilac','lingodirector','manxome','mars','matrix','metacosm','midnight','midnight2','mod_tcsoft','morning','murphy','navajo-night','navajo','nedit','nedit2','neon','night','nightshimmer','nightwish','northsky','nuvola','oceanblack','oceandeep','oceanlight']
" let g:mycolors = ['olive','pablo','papayawhip','peachpuff','potts','print_bw','ps_color','putty','putty2','python','redblack','relaxedgreen','reloaded','revolutions','robinhood','ron','sand','scite','sea','sean','seashell','sf','shine','simpleandfriend','ly slate','taqua','tcsoft','tibet','tolerable','tomatosoup']
" let g:mycolors = ['toothpik','torte','transparent','turbo','umber-green','vc','vcbc','white','whitedust','wintersday','xemacs','xian','zellner','zenburn','votl_dark','votl_light','votl_test','blue','darkblue','default','delek','desert','elflord','evening','industry','koehler','morning','murphy','pablo','peachpuff','ron','shine','slate','torte','zellner']


" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(g:mycolors)
      echo '  '.join(map(g:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let g:mycolors = map(paths, 'fnamemodify(v:val, ":t:r")')
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let g:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let g:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(g:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(g:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(g:mycolors))
    if how == 0
      let current = localtime() % len(g:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(g:mycolors))
        let current = (how>0 ? 0 : len(g:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.g:mycolors[current]
      break
    catch /E185:/
      call add(missing, g:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

