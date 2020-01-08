hi WildMenu ctermbg=2 guifg=BLACK guibg=#50fa7b gui=none
hi CursorLineNr ctermbg=2 ctermfg=0 guifg=#50fa7b gui=none
hi VertSplit ctermfg=237 ctermbg=237 cterm=bold guifg=#3a3a3a guibg=#3a3a3a gui=bold
let s:black          = [ '#1c1c1c', 234 ]
let s:dark_gray      = [ '#262626', 235 ]
let s:gray           = [ '#3a3a3a', 237 ]
let s:light_gray     = [ '#4e4e4e', 239 ]
let s:white          = [ '#dadada', 253 ]
let s:dark_blue_gray = [ '#6272a4', 60  ]
let s:purple         = [ '#bd93f9', 141 ]
let s:pink           = [ '#ff79c6', 212 ]
let s:yellow         = [ '#f1fa8c', 11 ]
let s:orange         = [ '#ffb86c', 172 ]
let s:red            = [ '#AA0000', 9 ]
let s:blue           = [ '#AA0000', 4 ]

let s:normal_0       = [ '#000000', 27 ]
let s:normal_1       = [ '#000000', 24 ]
let s:normal_2       = [ '#000000', 23 ]
let s:normal_3       = [ '#000000', 59 ]

let s:normal_0_fg       = [ '#000000', 255 ]
let s:normal_1_fg       = [ '#000000', 255 ]
let s:normal_2_fg       = [ '#000000', 255 ]
let s:normal_3_fg       = [ '#000000', 255 ]

let s:normal_right_0  = [ '#000000', 15 ]
let s:normal_right_1  = [ '#000000', 245 ]
let s:normal_right_2  = [ '#000000', 238 ]
let s:normal_right_3  = [ '#000000', 236 ]

let s:normal_right_0_fg  = [ '#000000', 0 ]
let s:normal_right_1_fg  = [ '#000000', 0 ]
let s:normal_right_2_fg  = [ '#000000', 255 ]
let s:normal_right_3_fg  = [ '#000000', 255 ]

let s:insert_0       = [ '#000000', 255 ]
let s:insert_1       = [ '#000000', 17 ]
let s:insert_2       = [ '#000000', 21 ]
let s:insert_3       = [ '#000000', 27 ]

let s:insert_0_fg     = [ '#000000', 20  ]
let s:insert_1_fg     = [ '#000000', 255 ]
let s:insert_2_fg     = [ '#000000', 255 ]
let s:insert_3_fg     = [ '#000000', 255 ]

let s:insert_right_0       = [ '#000000', 7 ]
let s:insert_right_1       = [ '#000000', 14 ]
let s:insert_right_2       = [ '#000000', 25 ]
let s:insert_right_3       = [ '#000000', 7 ]

let s:insert_right_0_fg     = [ '#000000', 0 ]
let s:insert_right_1_fg     = [ '#000000', 0 ]
let s:insert_right_2_fg     = [ '#000000', 255 ]
let s:insert_right_3_fg     = [ '#000000', 255 ]

let s:insert_middle  = [ '#000000', 24 ]

let s:base00         = [ '#000000', 237 ]
let s:base01         = [ '#000000', 234 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [
      \[s:normal_0_fg, s:normal_0, "bold"],
      \[s:normal_1_fg, s:normal_1],
      \[s:normal_2_fg, s:normal_2],
      \[s:normal_3_fg, s:normal_3]]
let s:p.normal.right = [
      \[s:normal_right_0_fg, s:normal_right_0],
      \[s:normal_right_1_fg, s:normal_right_1],
      \[s:normal_right_2_fg, s:normal_right_2],
      \[s:normal_right_3_fg, s:normal_right_3]]
let s:p.normal.middle   = [ [ s:white, s:dark_gray ] ]
let s:p.insert.left = [
      \[s:insert_0_fg, s:insert_0, "bold"],
      \[s:insert_1_fg, s:insert_1],
      \[s:insert_2_fg, s:insert_2],
      \[s:insert_3_fg, s:insert_3]]
let s:p.insert.right = [
      \[s:insert_right_0_fg, s:insert_right_0],
      \[s:insert_right_1_fg, s:insert_right_1],
      \[s:insert_right_2_fg, s:insert_right_2],
      \[s:insert_right_3_fg, s:insert_right_3]]
let s:p.insert.middle   = [ [ s:white, s:insert_middle ] ]

let s:p.inactive.left   = [ [ s:white, s:gray], [s:white, s:gray ] ]
let s:p.inactive.right  = [ [ s:white, s:gray], [s:white, s:gray ] ]
let s:p.inactive.middle = [ [ s:white, s:dark_gray ] ]
let s:p.replace.left    = [ [ s:black, s:yellow], [s:yellow, s:gray ] ]
let s:p.replace.right   = [ [ s:black, s:yellow], [s:yellow, s:gray ] ]
let s:p.visual.left     = [ [ s:black, s:pink], [s:pink, s:gray ] ]
let s:p.visual.right    = [ [ s:black, s:pink], [s:pink, s:gray ] ]
let s:p.tabline.left    = [ [ s:white, s:light_gray ] ]
let s:p.tabline.tabsel  = [ [ s:white, s:dark_blue_gray ] ]
let s:p.tabline.middle  = [ [ s:white, s:gray ] ]
let s:p.tabline.right   = [ [ s:white, s:dark_gray ] ]

let s:p.normal.error    = [ [ s:black, s:red ] ]
let s:p.normal.warning  = [ [ s:black, s:orange ] ]

let g:lightline#colorscheme#dracula#palette = lightline#colorscheme#flatten(s:p)
let coloName = 'dracula'

function! Modified()
  return &buftype ==# 'terminal' ? '' :
        \ &filetype =~# 'help\|vimfiler\|gundo\|fzf\|tagbar\|denite' ? '' :
        \ &modified ? s:mo_glyph : &modifiable ? '' :
        \ '-'
endfunction

function! GitBranch()
  let branch = get(g:,'coc_git_status', '')
  return winwidth(0) > 120 ? branch : ''
endfunction

function! GitStatus()
  let st = get(b:,'coc_git_status', '')
  return winwidth(0) > 120 ? ' '.st : ''
endfunction

function! Fileformat() 
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

function! Filetype() 
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '') : 'no ft') : ''
endfunction

function! Fileencoding() 
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
        \ winwidth(0) > 120 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

let g:coc_status_error_sign = '  '
let g:coc_status_warning_sign = '  '

function! LightLineCocError()
  let error_sign = get(g:, 'coc_status_error_sign' )
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, error_sign . info['error'])
  endif
  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn() abort
  let warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, warning_sign . info['warning'])
  endif
  return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

autocmd User CocDiagnosticChange call lightline#update()  

let g:lightline = { 
      \  'colorscheme': coloName,
      \  'active': {
      \    'left': [ 
      \       [ 'mode', 'paste' ], 
      \       [ 'gitbranch', 'readonly' ],
      \       [ 'gitstatus' ],
      \       [ 'filename' ],
      \       [ 'modified' ]
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'percent' ],
      \       [ 'fileformat', 'fileencoding', 'filetype' ],
      \       [ 'coc_error', 'coc_warning' ]
      \   ]
      \  },
      \  'component_function': {
      \    'gitbranch':    'GitBranch',
      \    'fileformat':   'Fileformat',
      \    'filetype':     'Filetype',
      \    'fileencoding': 'Fileencoding',
      \    'gitstatus':    'GitStatus'
      \  },
      \  'component': {
      \    'readonly': ' %R',
      \    'modified': '%m',
      \    'filename': ' %t',
      \    'percent': '%3p%%',
      \    'lineinfo': '並%3l:%-2v'
      \  },
      \  'component_expand': {
      \  'coc_error'        : 'LightLineCocError',
      \  'coc_warning'      : 'LightLineCocWarn'
      \  },
      \  'component_type': {
      \   'coc_error'        : 'error',
      \   'coc_warning'      : 'warning'
      \  },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \}


