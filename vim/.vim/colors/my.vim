" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"
" 简述：
" 如果是终端且为 256 色则使用下部分 256 色的配色方案
"   否则使用默认配色方案
" 如果是 gvim 则使用上部分配色方案
"
" 终端类型：gnome-terminal
" 1. .vimrc 文件中启用 256 色 set t_Co=256, 此设置只针对终端(terminal color)
"     试着使用 :set t_Co=2 / 8 看一下效果
" 2. 去掉所有的 ctermbg 使用终端默认背景
"

hi clear
" Normal ctermbg=NONE 不起作用
" hi clear Normal ctermbg=NONE

" 终端下 dark 的作用会使用 gui=bold/cterm=bold 属性生效
" set background=dark
" 同 dark 相反
" set background=light
" 终端默认不加粗, 这三个值在 gvim 下都不起作用
set bg&

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="my"

"
" Support for gvim
"
if has("gui_running")

  if exists("g:my_original")
      let s:my_original = g:my_original
  else
      let s:my_original = 0
  endif


  hi Boolean         guifg=#AE81FF
  hi Character       guifg=#E6DB74
  hi Number          guifg=#AE81FF
  hi String          guifg=#E6DB74
  hi Conditional     guifg=#F92672               gui=bold
  hi Constant        guifg=#AE81FF               gui=bold
  hi Cursor          guifg=#000000 guibg=#F8F8F0
  hi Debug           guifg=#BCA3A3               gui=bold
  hi Define          guifg=#66D9EF
  hi Delimiter       guifg=#8F8F8F
  hi DiffAdd                       guibg=#13354A
  hi DiffChange      guifg=#89807D guibg=#4C4745
  hi DiffDelete      guifg=#960050 guibg=#1E0010
  hi DiffText                      guibg=#4C4745 gui=italic,bold

  hi Directory       guifg=#A6E22E               gui=bold
  hi Error           guifg=#960050 guibg=#1E0010
  hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
  hi Exception       guifg=#A6E22E               gui=bold
  hi Float           guifg=#AE81FF
  hi FoldColumn      guifg=#465457 guibg=#000000
  hi Folded          guifg=#465457 guibg=#000000
  hi Function        guifg=#A6E22E
  hi Identifier      guifg=#FD971F
  hi Ignore          guifg=#808080 guibg=bg
  hi IncSearch       guifg=#C4BE89 guibg=#000000

  hi Keyword         guifg=#F92672               gui=bold
  hi Label           guifg=#E6DB74               gui=none
  hi Macro           guifg=#C4BE89               gui=italic
  hi SpecialKey      guifg=#66D9EF               gui=italic

  hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
  hi ModeMsg         guifg=#E6DB74
  hi MoreMsg         guifg=#E6DB74
  hi Operator        guifg=#F92672

  " complete menu
  hi Pmenu           guifg=#66D9EF guibg=#000000
  hi PmenuSel                      guibg=#808080
  hi PmenuSbar                     guibg=#080808
  hi PmenuThumb      guifg=#66D9EF

  hi PreCondit       guifg=#A6E22E               gui=bold
  hi PreProc         guifg=#A6E22E
  hi Question        guifg=#66D9EF
  hi Repeat          guifg=#F92672               gui=bold
  hi Search          guifg=#FFFFFF guibg=#455354
  " marks column
  hi SignColumn      guifg=#A6E22E guibg=#232526
  hi SpecialChar     guifg=#F92672               gui=bold
  hi SpecialComment  guifg=#465457               gui=bold
  hi Special         guifg=#66D9EF guibg=bg      gui=italic
  hi SpecialKey      guifg=#888A85               gui=italic
  if has("spell")
      hi SpellBad    guisp=#FF0000 gui=undercurl
      hi SpellCap    guisp=#7070F0 gui=undercurl
      hi SpellLocal  guisp=#70F0F0 gui=undercurl
      hi SpellRare   guisp=#FFFFFF gui=undercurl
  endif
  hi Statement       guifg=#F92672               gui=bold
  hi StatusLine      guifg=#455354 guibg=fg
  hi StatusLineNC    guifg=#808080 guibg=#080808
  hi StorageClass    guifg=#FD971F               gui=italic
  hi Structure       guifg=#66D9EF
  hi Tag             guifg=#F92672               gui=italic
  hi Title           guifg=#ef5939
  hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

  hi Typedef         guifg=#66D9EF
  hi Type            guifg=#66D9EF               gui=none
  hi Underlined      guifg=#808080               gui=underline

  hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
  hi VisualNOS                     guibg=#403D3D
  hi Visual                        guibg=#403D3D
  hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
  hi WildMenu        guifg=#66D9EF guibg=#000000

  if s:my_original == 1
     hi Normal          guifg=#F8F8F2 guibg=#272822
     hi Comment         guifg=#75715E
     hi CursorLine                    guibg=#3E3D32
     hi CursorColumn                  guibg=#3E3D32
     hi LineNr          guifg=#BCBCBC guibg=#3B3A32
     hi NonText         guifg=#BCBCBC guibg=#3B3A32
  else
     hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
     hi Comment         guifg=#465457
     hi CursorLine                    guibg=#293739
     hi CursorColumn                  guibg=#293739
     hi LineNr          guifg=#BCBCBC guibg=#232526
     hi NonText         guifg=#BCBCBC guibg=#232526
  end

endif

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   "hi DiffAdd
   hi DiffChange      ctermfg=181
   hi DiffDelete      ctermfg=162
   hi DiffText                                cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219
   hi ErrorMsg        ctermfg=199               cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67
   hi Folded          ctermfg=67
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244
   hi IncSearch       ctermfg=193

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16              cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81
   "hi PmenuSel
   "hi PmenuSbar
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253

   " marks column
   hi SignColumn      ctermfg=118
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238
   hi StatusLineNC    ctermfg=244
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231               cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244               cterm=bold
   "hi VisualNOS
   "hi Visua
   hi WarningMsg      ctermfg=231               cterm=bold
   hi WildMenu        ctermfg=81

   hi Normal          ctermfg=252
   hi Comment         ctermfg=59
   hi CursorLine                                cterm=none
   "hi CursorColumn
   hi LineNr          ctermfg=250
   hi NonText         ctermfg=250
end
