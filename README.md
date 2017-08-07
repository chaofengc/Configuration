# Vim and Tmux configuration
 - [Vim Config](#vim-config)
   * [Update to Vim 8](#update-to-vim-8)
   * [Plugin Notes](#plugin-notes)
 - [Tmux Config](#tmux-config)
 - [How to cooperate vim and tmux](#how-to-cooperate-vim-and-tmux)
 - [SecureCRT configuration](#securecrt-configuration)

## Vim Config
My vimrc and some candidates
- [`.vimrc`](.vimrc)
- https://github.com/samlaudev/ConfigurationFiles
- https://github.com/GoYchen/VIM_TMUX
- https://github.com/PytLab/dotfiles
- Reference: http://www.jianshu.com/p/f0513d18742a

### Update to Vim 8
Vim 8 has many good features, and support some convenient plugin. Update to vim 8 with the following lines.
```
sudo add-apt-repository ppa:jonathonf/vim     # get the newest version of vim
sudo apt-get update && sudo apt-get upgrade   # update package
sudo apt-get install vim-nox                  # add python3 support
```
To work with python 2
```
sudo apt install vim-nox-py2
sudo update-alternatives --set vim /usr/bin/vim.nox-py2
sudo update-alternatives --set vi /usr/bin/vim.nox-py2
```
### Plugin Notes
Plugin List

Name    | Function
----    | ---
'Lokaltog/vim-powerline'           | Bottom status bar
'altercation/vim-colors-solarized' | Color Theme
'Valloric/YouCompleteMe'           | Autocomplete
'ctrlpvim/ctrlp.vim'               | File Search
'scrooloose/nerdtree'              | File Tree
'majutsushi/tagbar'                | Function and Variable Tag Bar
'Yggdroot/indentLine'              | show indent 
'jiangmiao/auto-pair'              | Auto pair ({["
'tell-k/vim-autopep8'              | <F8> Auto format python file 
'scrooloose/nerdcommenter'         | <F5> Quick comment 
'fholgado/minibufexpl.vim'         | File explore

#### YouCompleteMe
Ultimate auto-complete plugin for Vim. After install it, you still need to set the configuration by copy the example configuration file and modify it.
```
cp ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py ~/.vim  # Copy the example config file
```
Then, you need to compile it
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

## Tmux Config

My tmux configuration is in [`.tmux.conf`](.tmux.conf)  
Main features are
- Rebind `Ctrl+b` to `Ctrl+x`
- Enable mouse to select window and panel, resize panel
- Enlarge history to 10000 lines
- Horizontal split: `bind-key s`, Vertical split: `bind-key v`

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
