"
" Author ueaner <ueaner at gmail.com>
"
" 颜色数目
set t_Co=256
" 配色方案
colorscheme molokai

" ############# 模式/文件/编码 #############
" 关闭兼容模式(nocompatible)
set nocp
" ttyfast
set ttyfast
" vim 内部编码(buffer,菜单文本[gvim],消息文本等)
set encoding=utf-8
" 编辑的文件的编码
set fileencoding=utf-8
" windows 下开启此选项避免乱码
" language messages zh_CN.utf-8
" 去除 utf-8 BOM
set nobomb
" 为特定的文件类型载入相应的插件
filetype plugin on
" 不生成备份文件
set nobackup

" ############# 显示/缩进/高亮 #############
" 屏幕上下保留 3 行(光标滚动过程中)
set scrolloff=3
" 显示状态栏
set laststatus=2
" 状态栏/右下角显示行号和列号
set ruler
" 显示命令行栏
set showcmd
" 命令行列出所有的补全可能性(不进行补全)
set wildmode=list:longest
" 显示行号
"set nu
" 显示相对行号(relativenumber vim7.3+)
set rnu
" 突出显示当前行
set cursorline
" 不自动折叠(zR 展开所有折叠航)
set foldlevel=100
" 显示匹配括号
set magic
" 匹配的字符
" set matchpairs=(:),{:},[:],<:>
" 括号自动补全
" inoremap ( ()<ESC>i
" inoremap { {}<ESC>i
" inoremap [ []<ESC>i
" inoremap < <><ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i
" version 2
" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
" inoremap { {}<LEFT>
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>
"
" 不自动换行(超出窗口)
" set nowrap
" 显示空白字符
" set list
" 空白字符显示格式(:help listchars)
set listchars=tab:▸\ ,trail:-
" 1 个 TAB 占 4 个位置
set tabstop=4
set shiftwidth=4
" 回退
set backspace=indent,eol,start
" 自动缩进
set autoindent
" 智能缩进
" set smartindent
" 使用 C 语言风格缩进
"set cindent
" 打开语法高亮
syntax on

" ############# 搜索/帮助 #############
" 实时显示搜索结果
" set incsearch
" 默认使用中文帮助
set helplang=cn

" ############# TAB 键 PHP 函数自动完成 #############
" 自动完成的监听方式(添加一个字母或回退一个字母)
set complete-=k complete+=k
" 字典补全文件
set dictionary=$HOME/.vim/dict/php.dict
" 使用 TAB 键自动完成或尝试自动完成
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
" 重新映射 TAB 键到 InsertTabWrapper 函数
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

" 也可以使用自带的 Omni-complete 映射到 TAB 键对函数自动完成
" 方法: 将InsertTabWrapper函数中 "\<C-N>" 换成 "\<C-X><C-O>"
" :help i_CTRL-X_CTRL-O

" ############# 键映射 #############
" 开启 ALT 键映射(默认调用菜单) #不好使
" set winaltkeys=no
" leader
let mapleader = ","
" 输入模式下键入jj映射到<ESC>
inoremap jj <Esc>
" 插入空行
nnoremap <leader>a o<Esc>>
" 去除尾部空字符
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>W :%s/\s\+$//<CR>
" 将 4 个空格转换为一个 TAB
nnoremap <leader>T :%s/    /\t/g<CR>
" 更改窗口大小
nnoremap <leader>h :vertical resize -1<CR>
nnoremap <leader>j :resize -1<CR>
nnoremap <leader>k :resize +1<CR>
nnoremap <leader>l :vertical resize +1<CR>
" 切换窗口
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" Markdown to HTML
nnoremap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
" 练习 hjkl (禁用方向键)
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" ############# Tlist #############
" 禁止自动改变当前Vim窗口的大小
let Tlist_Inc_Winwidth=0
" 把方法列表放在屏幕的右侧
let Tlist_Use_Right_Window=1
" 当前不被编辑的文件的方法列表自动折叠(节约一些屏幕空间)
let Tlist_File_Fold_Auto_Close=1
" F3显示/隐藏Tlist
nnoremap <silent> <F8> :TlistToggle<CR>

" ############# NERDTree #############
" 通过/usr/share/vim/vim73/和/usr/share/vim/vimfiles/查看已有插件
" vim 7.3
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" ############# Omni-complete #############

" ############# ctags #############
" 设置 tags 文件路径: set tags=./tags,tags;$HOME
set tags=.tags

" ############# DoxygenToolkit #############
" DoxAuthor/DoxLic 所用基本信息
let g:DoxygenToolkit_authorName="ueaner ueaner@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_versionString="1.0"


" 引入针对 GVIM 配置文件
source $HOME/.gvimrc
