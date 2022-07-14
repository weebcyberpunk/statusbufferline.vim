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
    let g:sbline_ruler=1
endif

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
    endif

    return l:status

endfunction

set statusline=%!StatusBufferLine()
