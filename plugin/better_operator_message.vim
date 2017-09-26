function! s:better_operator_message()
  let number = len(v:event['regcontents'])

  if v:event['operator'] == 'c' || v:event['operator'] == 'd'
    let message = number . ' fewer lines'
  elseif v:event['operator'] == 'y'
    let message = number . ' lines yanked'
  else
    return
  endif

  if v:event['regname'] != ''
    let message = message . ' into register ' . v:event['regname']
  endif

  echom message
endfunction

set report=10000000000
augroup better_operator_message
  autocmd!
  autocmd TextYankPost * call <sid>better_operator_message()
augroup end
