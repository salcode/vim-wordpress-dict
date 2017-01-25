if exists("g:fe_wordpress_dicts") || v:version < 700 || &cp
  finish
endif
"
let g:fe_wordpress_dicts = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/data/*.dict'

augroup php_wordpress_dictionary
	autocmd!
	autocmd FileType php exe 'set complete+=k' . g:fe_wordpress_dicts
augroup END
