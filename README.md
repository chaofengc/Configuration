## vim and tmux configuration

### vimrc
I haven't found a good .vimrc yet, but here are some candidates

- https://github.com/samlaudev/ConfigurationFiles
- https://github.com/GoYchen/VIM_TMUX
- https://github.com/PytLab/dotfiles

#### Solarized Color scheme
First, clone color scheme to bundle folder  
`git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized`  
Then add the following lines to `.vimrc`
```
set t_Co=256                                                                                              
set term=screen-256color                                                                                                     syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
```

### tmux.conf

My tmux configuration is in [`tmux.conf`](.tmux.conf)  
Main features are
- Rebind `Ctrl+b` to `Ctrl+x`
- Enable mouse to select window and panel, resize panel
- Enlarge history to 10000 lines
- Horizontal split: `bind-key s`, Vertical split: `bind-key v`

### How to cooperate vim and tmux 
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
1. If you don't want to see the tool bar and make it like a terminal, change the view settings in `Preferences -> General -> view`
1. Show path in tab, `Preferences -> General -> Default Session -> Edit Default Settings -> Terminal -> Emulation`.  
Change terminal to `Xterm`, tick `ANSI color`. Change to a bigger `Scroll back buffer` if you want. (Reference [blog](http://blog.csdn.net/delphiwcdj/article/details/7226921)) 
