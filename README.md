# Vim and Tmux configuration
 - [Install](#install)
 - [Vim Config](#vim-config)
   * [Update to Vim 8](#update-to-vim-8)
   * [Plugin Notes](#plugin-notes)
 - [Tmux Config](#tmux-config)
 - [How to cooperate vim and tmux](#how-to-cooperate-vim-and-tmux)
 - [SecureCRT configuration](#securecrt-configuration)
![Example Image](example.png)

## Install

Please **install Anaconda and activate your Python environment first**, then clone this repository and Run install script 
```
git clone https://github.com/chaofengc/Configuration ~/
cd ~/Configuration
bash install.sh
```

## Vim Config
My vimrc and some candidates
- [`.vimrc`](.vimrc)
- https://github.com/samlaudev/ConfigurationFiles
- https://github.com/GoYchen/VIM_TMUX
- https://github.com/PytLab/dotfiles
- Reference: http://www.jianshu.com/p/f0513d18742a

[**HERE**](http://learnvimscriptthehardway.stevelosh.com/chapters/01.html) is a perfect book for you to learn vim scripts.

### Update Vim and Tmux using Anaconda 
As there are many new and convenient features in new version of tmux and vim, it is recommended to update vim and tmux. You are also suggested to do this through Anaconda, because sudo right is not needed and more importantly Anaconda only affects your own environment.
You can update Vim and Tmux using the following commands **Within your anaconda environment**
```
conda install -c conda-forge tmux==2.7
conda install -c conda-forge vim 
```
**Notice: remember that you can only use them where they are installed.**

### Plugin Notes
Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug), and here is the plugin list

Name                             | Function
----                             | ---
'vim-airline/vim-airline'        | Status bar
'vim-airline/vim-airline-themes' | Airline Themes
'Valloric/YouCompleteMe'         | Autocomplete
'ctrlpvim/ctrlp.vim'             | File Search
'scrooloose/nerdtree'            | File Tree
'majutsushi/tagbar'              | Function and Variable Tag Bar
'Yggdroot/indentLine'            | show indent
'jiangmiao/auto-pair'            | Auto pair ({["
'tpope/vim-surround'             | Add, delete, change delimiters
'tell-k/vim-autopep8'            | F8 Auto format python file
'tell-k/vim-autoflake'           | F9 Remove unused imports and variable in python file 
'scrooloose/nerdcommenter'       | Quick comment `<leader>+ci`
'tpope/vim-fugitive'             | Git wrapper in vim
'terryma/vim-smooth-scroll'      | Smooth scroll
'junegunn/vim-easy-align'        | Align codes easily
'tpope/vim-unimpaired'           | Easy :next and :previous
'plasticboy/vim-markdown'        | Markdown


#### Extra Dependencies of Plugins 
- `tagbar` F4, displays tags in a window
- `autopep8` F8, automatically formats Python code to conform to the PEP 8 style guide. **(Not work very well)**
- `autoflake` F9, automatically remove unused imports and variables in current python file.   

To make them work, you should install the following packages:
```
conda install -c conda-forge ctags
pip install autopep8
pip install autoflake
```

#### Frequently Used Custom Shortcuts 
**Note: map `<Space>` as `<leader>`**

*Normal Mode*

Command                    | Function
----                       | ---
`<leader> q`               | the same as `:q`
`<leader> w`               | the same as `:w`
`<leader> m`               | Open Nerdtree
`<leader> s`               | Set/Unset spell check
`Ctrl + w + v`             | Split window vertically
`<leader> ci`              | Quick comment
`z=`                       | Spell correct (Need to `:set spell`)
`gaip`                     | Align a paragraph by specific character
`gw`                       | Quick Git add
`gs`                       | Show Git status
`cc`(In Git status window) | Edit Git commit message
`<leader>gg`               | Go to function for python, supported by YouCompleteMe

*Insert Mode*
- Ctrl+l, ESC

## Tmux Config

My tmux configuration is in [`.tmux.conf`](.tmux.conf)  
Main features are
- Rebind `Ctrl+b` to `Ctrl+x`
- Enable mouse to select window and panel, resize panel
- Enlarge history to 10000 lines
- Horizontal split: `bind-key -`, Vertical split: `bind-key ]`
- Date and Time on status bar.

## How to cooperate vim and tmux 
For unknow reason, vim colortheme may not work in tmux without the following configuration  
(1) In .vimrc
```
se t_Co=256
set term=screen-256color
```
(2) In .bashrc
```
 alias tmux="TERM=screen-256color tmux" 
```
Note: please use `source ~/.bashrc` to make it effective.

## SecureCRT configuration
Remember keys in Mac. If you want to remember ssh keys in mac, you must turn off the key chains in `Preferences -> General -> Mac options`
### Color 
1. Change the theme to White/Black in `Preferences -> General -> Default Session -> Edit Default Settings -> Appearance`
1. You can also config the ANSI color under the `Appearance`, details see [this blog](http://liam0205.me/2015/09/24/color-scheme-for-securecrt/index.html)
### Session Setting
1. Hide tool bar, `Preferences -> General -> view`
1. Show path in tab, `Preferences -> General -> Default Session -> Edit Default Settings -> Terminal -> Emulation`.  
Change terminal to `Xterm`, tick `ANSI color`. Change to a bigger `Scroll back buffer` if you want. (Reference [blog](http://blog.csdn.net/delphiwcdj/article/details/7226921)) 
1. Enable `Fn` keys in Mac. Change terminal to `Xterm`.
### References
1. [SecureCRT实用配置](http://xstarcd.github.io/wiki/windows/SecureCRT_confs.html)
