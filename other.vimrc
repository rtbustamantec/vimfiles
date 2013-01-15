" function to loop through a specified path and include each tag file
if has('python')
function! BuildTagsFromPath()
python << EOF
import os
import vim

tags = ''
tagpath = "%s/%s" % (os.environ['HOME'], '.vimtags')

if (os.path.exists(tagpath)):
    for file in os.listdir(tagpath):
        if (file != 'README'):
            tags += "%s/%s," % (tagpath, file)

cmdsettags = "set tags=%s" % tags
vim.command(cmdsettags)
EOF
endfunction

call BuildTagsFromPath()
endif

let g:tagbar_ctags_bin = '/Users/soloidx/apps/homebrew/bin/ctags'

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
