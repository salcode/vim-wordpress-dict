if exists("g:fe_wordpress_dicts") || v:version < 700 || &cp
  finish
endif

" Path to dictionary files
let g:fe_wordpress_dicts = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/data/*.dict'

" List of FileTypes for dictionaries, alternatively can be set in .vimrc
if !exists("g:fe_wordpress_dicts_filetype_list")
    let g:fe_wordpress_dicts_filetype_list = ['php']
endif

augroup php_wordpress_dictionary
	autocmd!
	execute "autocmd FileType " . join(g:fe_wordpress_dicts_filetype_list, ",") . ' set complete+=k' . g:fe_wordpress_dicts
augroup END
