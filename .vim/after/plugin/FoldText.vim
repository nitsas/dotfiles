" Override Konfekt/FoldText's CustomFoldText() to preserve the line's actual
" indentation. The plugin default computes indent from foldlevel, which
" over-indents when syntax folding creates more nesting than the code's
" real indentation (e.g. JS specs via vim-polyglot).
function! CustomFoldText(...)
  let delim = a:0 > 0 && !empty(a:1) ? a:1 : ' '

  let fs = nextnonblank(v:foldstart)
  let head = getline(fs > 0 && fs <= v:foldend ? fs : v:foldstart)
  let head = substitute(head, '\t', repeat(' ', &tabstop), 'g')

  let foldSize = 1 + v:foldend - v:foldstart
  let tail = " " . foldSize . " lines "
  if has("float")
    let tail .= "[" . printf("%.1f", (foldSize*1.0)/line("$")*100) . "%] "
  endif

  let maxWidth = winwidth(0) - &foldcolumn - (&number ? &numberwidth : 0)

  if strwidth(head) > maxWidth - strwidth(tail)
    let head = strpart(head, 0, maxWidth - strwidth(tail) - 2) . '..'
  endif

  return head . repeat(delim, maxWidth - strwidth(head) - strwidth(tail)) . tail
endfunction
