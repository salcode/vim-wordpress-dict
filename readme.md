Vim WordPress Dictionary Plugin
===============================

This plugin loads dictionary files for WordPress core into Vim.  The dictionary
files include action hooks, filter hooks, functions, and classes.

Installation
------------

You should be able to use whatever preferred method of plugin installation you prefer.  Personally, I use the excellent [vim-plug](https://github.com/junegunn/vim-plug) which allows me to install the plugin by adding the following to my `.vimrc`

```
Plug 'salcode/vim-wordpress-dict'
```

Rebuild the dict Files
----------------------

You can rebuild the dict files by running the following from the command line.

```
$ bash ./build.sh
```

### How Does It Work

The build script downloads the latest release of WordPress and uses regular
expressions to extract the values for the dict files.

Credits
-------

This project is a fork of [vim-dict-wordpress](https://github.com/miya0001/vim-dict-wordpress) by @miya0001, who did all of the amazing hard work to make this possible.  I've merely wrapped the code in a Vim plugin for ease of installation.

- @miya0001 - original author
- @salcode

License
-------

This dictionary file is released under the terms of the GPL version 2 or (at your option) any later version.
