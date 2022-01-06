" Mappings config

" Sudo make me a sandwich
cmap w!! %!sudo tee > /dev/null %

" Fix common typos
" I often hold down shift too long when saving files
cabbrev W write
cabbrev Q quit

" Abbreviations/Command remapping
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>

" Toggle paste on/off
set pastetoggle=<F2>

" Shift-Tab to unindent
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" LaTeX paragraph formatting
"   Lets you use \gq or gqlp to format a paragraph respecting LaTeX
"   environments
map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

" Mapping - \x to execute the current line either in vim or lua
" Taken from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/keymaps.vim#L52-L60
function! s:executor() abort
    if &ft == 'lua'
        call execute(printf(":lua %s", getline(".")))
    elseif &ft == 'vim'
        exe getline(".")
    endif
endfunction
nnoremap <leader>x :call <SID>executor()<CR>

"Use J an d K in visual mode to move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Quickfix mappings
nnoremap <C-q> :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>q :lopen<CR>
nnoremap <leader>k :lprev<CR>
nnoremap <leader>j :lnext<CR>
