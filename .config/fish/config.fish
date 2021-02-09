status --is-interactive; and source (rbenv init -|psub)

set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_display_git_master_branch yes

set -g GTK_IM_MODULE fcitx
set -g XMODIFIERS @im=fcitx
set -g QT_IM_MODULE fcitx
set -x GOPATH /home/fill/src/go

set -x CHROME_EXECUTABLE '/usr/bin/google-chrome-stable'

set PATH /home/fill/src/go/bin /home/fill/flutter/bin /opt/dart-sdk /home/fill/src/dotfiles/bin/shell /home/fill/.rbenv/versions/2.7.1/bin ~/local/matlab/bin ~/src/github.com/fillu87gyc/data-science/libsvm-3.24 $PATH

function fish_right_prompt; end

alias g='git'
alias t='tmux'
alias vi='nvim'
alias tm='tmuximum'
alias ll='ls -altFG'
alias gbr='hub browse'
alias gis='hub issue'
alias gisc='hub issue create -oc'
alias ag='ag --hidden --smart-case'
alias reload='source ~/.config/fish/config.fish; and echo reload!!'
alias re='reload'
alias a.out='./a.out'
alias so='source'
alias mkdir='mkdir -p'
alias bd='bd -s'
alias iftop='sudo iftop -i wlp3s0'
alias sp='bash ~/src/dotfiles/bin/shell/vim-speedtest.sh'
alias sys='sudo systemctl'
alias smb_start='sudo smb_start.sh'

alias gl='git log --color --graph --pretty=format:"%C(red reverse)%d%Creset%C(white reverse) %h% Creset %C(green reverse) %an<@%cn> %Creset %C(cyan)%ar%Creset%n%C(white bold)%w(80) %s%Creset%n%n%w(80,2,2)%b" | emojify | less -r'
alias dockerd='docker build --pull --rm -f "Dockerfile" -t yuukikaede/pkg-buildin:(LC_ALL=C date "+%Y-%h%d-%H%M%S") "."'

function g --wraps git
  hub $argv;
end
