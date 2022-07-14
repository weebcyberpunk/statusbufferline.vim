" Title:        statusbufferline.vim 
" Description:  statusline that shows the buffer list
" Last Change:  13 July 2022
" Mainteiner:   GG https://github.com/weebcyberpunk
" Location:     plugin/statusbufferline.vim
" License:      MIT

hi StatusBufferLineActive ctermbg=NONE guibg=NONE ctermfg=LightGreen guifg=LightGreen

if !exists('g:sbline_show_bfnr')
    let g:sbline_show_bfnr=1
endif

if !exists('g:sbline_show_modified')
    let g:sbline_show_modified=1
endif

if !exists('g:sbline_ruler')
    let g:sbline_ruler=3
endif

if !exists('g:sbline_to_status')
    let g:sbline_to_status=0
endif

if !exists('g:sbline_to_tabs')
    let g:sbline_to_tabs=1
endif

function! TabList()

    let l:list=""
    let l:tabs=gettabinfo()
    let l:cur=tabpagenr()

    if len(l:tabs) > 1
        for l:tab in l:tabs

            if l:tab.tabnr == l:cur
                let l:list..="%#StatusBufferLineActive#"
            endif

            let l:list..=" "..l:tab.tabnr

            if l:tab.tabnr == l:cur
                let l:list..="%#*#"
            endif
        endfor
    endif

    return l:list

endfunction

function! StatusBufferLine()

    let l:status=""
    let l:bufs=getbufinfo({'buflisted':1})
    let l:counter=0

    for l:bufr in l:bufs

        if l:counter != 0
            let l:status..="| "
        endif

        if l:bufr.bufnr == bufnr('%') && len(l:bufs) > 1
            let l:status..="%#StatusBufferLineActive#"
        endif


        if g:sbline_show_bfnr == 1
            let l:status..=l:bufr.bufnr.." "
        endif

        let l:status..=bufname(bufr.bufnr).." "

        if l:bufr.changed && g:sbline_show_modified == 1
            let l:status..="[+] "
        endif

        if l:bufr.bufnr == bufnr('%')
            let l:status..="%#*#"
        endif

        let l:counter+=1

    endfor

    if g:sbline_ruler == 1
        let l:status..='%=%-14.(%l,%c%V%) %P'
    elseif g:sbline_ruler == 2
        let l:status..='%=%-10.(%l,%2c:%L%)'
    elseif g:sbline_ruler == 3
        let l:status..="%="..TabList()
    endif

    return l:status

endfunction

if g:sbline_to_status == 1
    set statusline=%!StatusBufferLine()
elseif g:sbline_to_tabs == 1
    set tabline=%!StatusBufferLine()
endif
