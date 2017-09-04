if exists("g:loaded_nerdtree_multicreate")
    finish
endif

let g:loaded_nerdtree_multicreate = 1
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')


"add a menu separator (a row of dashes) before our new menu item
call NERDTreeAddMenuSeparator()

call NERDTreeAddMenuItem({
            \ 'text': '(T)emplate' ,
            \ 'shortcut': 'T',
            \ 'callback': 'VimNerdtreeAddTemplatePerl' })

function! VimNerdtreeAddTemplate()
    let templateName = input(" Enter the template name: ")

    let currentDir = g:NERDTreeDirNode.GetSelected()
    let newPath = g:NERDTreePath.Create(currentDir.path.str() . "/" . templateName . "/")

    call NERDTreeRender()
endfunction

function! VimNerdtreeAddTemplatePerl()
    let templateName = input(" Enter the template name: ")

    let currentDir = g:NERDTreeDirNode.GetSelected()
    let newPath = g:NERDTreePath.Create(currentDir.path.str() . "/" . templateName . "/")

    exec "py3 template_name='" . templateName . "'"
    exec "py3 templates_path='" . s:path . "/../templates'" 
    exec "py3 output_path='" . currentDir.path.str() . "/" . templateName . "'"
    exec "py3file " . s:path . '/../python/process_templates.py'
    call NERDTreeRender()
endfunction
