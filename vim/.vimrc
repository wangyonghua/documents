" ll system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch        " Show matching brackets.
"set ignorecase        " Do case insensitive matching
"set smartcase        " Do smart case matching
"set incsearch        " Incremental search
"set autowrite        " Automatically save before commands like :next and :make
"set hidden        " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"定义快捷键前缀
let mapleader=";"
"打开文件类型监听
filetype on
filetype plugin on
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件都放在这×××××××××××××××××××××××××××××××××××××××××××××××××
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"颜色插件       只能设置一个        有设置              00000000
"无命令：
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/phd'
"Plugin 'tomasr/molokai'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"基于缩进的可视阅读插件             有设置              00000001
"无命令：
Plugin 'nathanaelkane/vim-indent-guides'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"书签插件                           无设置              00000010
"有命令：
"               m,      顺序书签
"               m-      删除书签
"               ']      遍历书签
"               '[      同上
Plugin 'kshenoy/vim-signature'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"注释插件       比较方便            无设置              00000011
"有命令：
"               ;cc     注释选中区
"               ;cu     取消
Plugin 'scrooloose/nerdcommenter'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"模块补全插件   这个要多说几句了。自身并没有带预定已代码模板，
"可以从http://github.com/honza/vim-snippets获取。要把模板放在
"~/.vim/bundle/下子目录，我们放在
"～/.vim/bundle/ultisnips/mysnippets/下,要注意命名规范。
"并要有let g:UltiSnipsSnippetDirectories=["mysnippets"].
"                                   有设置              00000100
"有命令：
"               键入关键字后按ctrl 就行
Plugin 'SirVer/ultisnips'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"工程文件列表插件                   有设置              00000101
"有命令：
"               ;fl     打开列表
"               q       退出
"               o       打开或折叠
Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多文档编辑插件                     有设置              00000110
"有命令：
"               ;bl     显示或隐藏窗口
"               ;jl     向左遍历
"               ;k;     向右
"               ctrl+ww 高亮一个
"               光标在时 d 可删除文件
"               在时 v s  分别打开另一个窗口
Plugin 'fholgado/minibufexpl.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"查找插件       必须在shell中执行sudo apt install ack-grep 获取
"               查找能力才可以查找。有设置              00000111
"有命令：
"               把光标放在要查找出  ;sp     查找
"                                   p       查看完整
"                                   q       退出
"                                   回车    进入查找处
Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多光标编辑插件                     有设置              00001000
"有命令：
"               在可视模式下选中，可用ctrl+n选中一样的;
"               然后可同时操作几个光标
Plugin 'terryma/vim-multiple-cursors'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim自带有强大的精确替换功能，所以下面只有设置，没插件。
"命令：                     
"               <Leader>R       不用确认，非整词替换
"这个最常用     <Leader>rw       不用确认，整词替换
"               <Leader>rc       确认，非整词替换
"               <Leader>rcw  <Leader>rwc       确认，整词替换
"                           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"下面四个插件放一块吧。就是基于标签做的很牛的事！！！
"先在shell下安装ctags.命令：sudo apt install ctags   

"基于标签的标识符列表插件           有设置              00001001
"有命令：
"               ;ilt    列出文件中全部标签，可以选中跳转
"               ;tn     可以实现声明和定义在文件间的跳转
"               但前提是先ctrl+]压入桟
"               ;tp     反跳
"               ctrl+i ctrl+o ctrl+t 等实现返回
Plugin 'majutsushi/tagbar'
""""""""""""""""""""""""""""
"这三个插件实现自动生成引入标签，indexer 依赖 DfrankUtil 和 vimprj。
"实现不用再执行下面命令来生成标签。
"ctags-R --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c
"                                   有设置              00001010
"无命令：

"但要在~/.indexer_files内配置工程信息！！！！！！！！！！！！！！
" 自动生成的标签都在~/.indexer_files_tags里
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"background set
set background=dark
colorscheme default
"colorscheme solarized
"colorscheme phd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cursor set
set gcr=a:block-blinkon0
"set number
set cursorline
set cursorcolumn
set ruler
"set laststatus=2
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab set缩进
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fold the text 折叠
"za  zM   zR
set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"基于缩进的快捷阅读
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"书签快捷键
"let g:SignatureMap = {
 "       \ 'Leader'             :  "m",
 "       \ 'PlaceNextMark'      :  "m,", 标记
 "       \ 'PurgeMarksAtLine'   :  "m-", 删除
 "       \ 'PurgeMarks'         :  "mda",全删
 "       \ 'GotoNextLineAlpha'  :  "']",遍历
 "       \ 'GotoPrevLineAlpha'  :  "'[", "       \ 'GotoNextLineByPos'  :  "]'",
 "       \ 'GotoPrevLineByPos'  :  "['",
 "       \ }
""//
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=["mysnippets"]
"let g:UltiSnipsExpandTrigger="<Leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=22
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"注：    <Leader>fl  打开
"         q          退出
"         P         到根目录
"         o         展开或折叠
"         p         跳到文节点
"         t         在新tab中打开
"         T         选中文件

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"注：：：：：之前一定要在shell下安装ack，才能使用。
"内容查找sp =  search in project
nnoremap <Leader>sp :CtrlSF<CR>
"   ;sp查找该关键字
"   p  查看
"   q  退出
"   回车  进入此处
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多光标功能，强大到无敌。除了用于全局替换，还可以实现很多炫酷的功能。
"<ctrl-n>  ，用于选择下一个一样的字符串
"可视化下选择，然后便可操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

"常用的是  ；rw 不需确定但整词替换。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置子窗口在右边 
let tagbar_right=1 
" 显示／隐藏列表窗口快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置窗口宽度 
let tagbar_width=32 
" 窗口不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


"下面是声明/定义跳转的设置

"  g] 命名罗列出来
"
"  ctrl+]  把标签压入标签栈里，才可以遍历 一定要先压入栈！！！！！！！！！！
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" ctrl+t  返回查找位置。 
"  再次进入 ctrl+i 
" ctrl+o 也是返回。和Ctrl+t 不同 
"""""""""""""""""""""""""""""""""""下面要装3个插件满足一个功能，即：不用再输入
"ctags-R --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c
"了。三个插件是 indexer  它依赖 DfrankUtil 和 vimprj .


" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


"一定要在～/indexer_files文件中加入工程所在目录，才能自动实现生成标签并引入。
"可以在～/indexer_files_tags目录下找到。


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"多文档编辑的插件设置,不确定.先放这
map <Leader>bl :MBEToggle<CR>
map <Leader>kl :MBEbn<CR>
map <Leader>jl :MBEbp<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set splitright
set splitbelow

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"autocmd VimEnter * NERDTree
map <Leader>t :NERDTree<CR>
map <Leader>q :q<CR>
map <Leader>q! :q!<CR>
map <Leader>w :w<CR>
map <Leader>w! :w!<CR>
map <Leader>no :nohl<CR>
nmap <F9> :set nu<CR>
nmap <F10> :set nonu<CR>
