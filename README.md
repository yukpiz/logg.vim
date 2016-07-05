# About

[![Build Status](https://travis-ci.org/yukpiz/logg.vim.svg?branch=master)](https://travis-ci.org/yukpiz/logg.vim)  

logg.vim is a support for **logger** from VimScript.  
**!! Current version is the beta !!**


# Requirements

* Vim 7.4 or later.
* Lua interface(+lua).


# Installation

Your ``.vimrc`` :laughing:  

```vim
dein#add('yukpiz/logg.vim')
```

or  

```vim
NeoBundle 'yukpiz/logg.vim'
```


# How to use

You can be output the log messages.  

```vim
call logg#debug('DEBUG MESSAGE.')
```

Other functions.  

```vim
call logg#error('ERROR MESSAGE.')
call logg#warn('WARNING MESSAGE.')
```

Log file is output in default to the your ``$HOME`` directory,  
And you can change the settings.  

```vim
let g:logg_file_path = $HOME . '/logg.log'
```

Date format will can be change.  
Default ``%c``, [Learn the date format](http://vim.wikia.com/wiki/Insert_current_date_or_time):point_up:  

```vim
let g:logg_date_format = '%c'
```



# Features

* Log message format  
    ``[%D(ate)] [%T(ag)] %M(essage)``  


# License

Public Domain


# Author

Yuuki Zayasu(yukpiz@gmail.com:e-mail:)  



