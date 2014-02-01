vim-airline-loclist
===================

This is an extension for vim-airline to populate its warning section with the infomation available in VIM's location list. I made this extension since YouCompleteMe no longer works together with Syntastic.

You need to add the following to your vimrc to enable the extension:

    let g:airline#extensions#loclist#enabled = 1
