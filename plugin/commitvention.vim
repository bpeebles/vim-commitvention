" vim-commitvention - A Vim package to make commit writing bettter
" Maintainer: Byron Peebles <https://github.com/bpeebles/>
" Location: plugin/commitvention.vim
" Version: 0.1.2

if exists('g:loaded_commitvention') || v:version < 700 || &compatible
  finish
endif
let g:loaded_commitvention = 1

let g:commitvention_branch_patterns = [
      \     '\C[A-Z][A-Z0-9]*-[0-9]*'
      \ ]

let g:commitvention_branch_regex = '^# On branch \([^ ]*\)$'

function! s:get_branch() abort
  if g:loaded_fugitive
    return FugitiveHead()
  endif

  let l:branch_line = search(g:commitvention_branch_regex, 'ncw')
  if l:branch_line <= 0
    return ''
  endif

  let l:line = getline(l:branch_line)
  let l:branch = matchlist(l:line, g:commitvention_branch_regex)
  return l:branch[1]
endfunction

function! s:create_commit_subject() abort
  let l:branch = s:get_branch()
  if l:branch !=# '' && getline(1) !~ '^' . l:branch
    for l:pattern in g:commitvention_branch_patterns
      if match(l:branch, l:pattern) != -1
        call setline(1, l:branch . ' ' . getline(1))
        break
      endif
    endfor
  endif
endfunction

augroup commitvention
  autocmd!
  autocmd FileType gitcommit call s:create_commit_subject()
augroup END
