#. ------------------ #
# >>>>> EXPORTS <<<<< #
#. ------------------ #
export EDITOR=/usr/bin/vim
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
export VISUAL=/usr/bin/vim
#Sets environment variables

export XDG_CACHE_HOME=$HOME'/.cache'
export XDG_CONFIG_HOME=$HOME'/.config'
export XDG_DATA_HOME=$HOME'/.local/share'
#Sets all my XDG paths

export BROWSER=$HOME/Git/OneOffCodes/Shell/dmenu_openwith_prompt
export CARGO_HOME="$XDG_DATA_HOME"/cargo
#export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
export FZF_DEFAULT_OPTS='-i --border'
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export ICEAUTHORITY="$XDG_RUNTIME_DIR"/ICEauthority
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export MAILCAPS="$XDG_CONFIG_HOME"/mailcap/mailcap
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PYLINTRC="$XDG_CONFIG_HOME"/pylint/pylintrc

export RTV_BROWSER=$HOME/Git/OneOffCodes/Shell/dmenu_openwith_prompt
export RTV_URLVIEWER=/usr/bin/urlscan
#Export RTV

export PATH=$HOME/bin:/usr/local/bin:$HOME/Git/OneOffCodes/Python:$HOME/Git/OneOffCodes/Shell:$PATH
#Path includes path to all scripts i want to run natively

GPG_TTY=$(tty)
export GPG_TTY

if [ ! -e ~/.ssh/agentsock ]; then
    eval $(ssh-agent -a ~/.ssh/agentsock)
    ssh-add
else
    export SSH_AUTH_SOCK=~/.ssh/agentsock
fi
#. ---------------------- #
# >>>>> END EXPORTS <<<<< #
#. ---------------------- #
#. ------------------- #
# >>>>> SETTINGS <<<<< #
#. ------------------- #
HISTFILE=~/.config/zsh/histfile
#Lines configured by zsh-newuser-install

HISTSIZE=100000
#Save 1000 items in history

SAVEHIST=100000
#Save 1000 items in history

setopt EXTENDED_HISTORY
#Write the history file in the ":start:elapsed;command" format

setopt INC_APPEND_HISTORY
#Write to the history file immediately, not when the shell exits

setopt SHARE_HISTORY
#Share history between all sessions

setopt HIST_SAVE_NO_DUPS
#Don't write duplicate entries in the history file

setopt HIST_EXPIRE_DUPS_FIRST
#Expire duplicate entries first when trimming history

setopt HIST_IGNORE_DUPS
#Don't record an entry that was just recorded again

setopt HIST_IGNORE_ALL_DUPS
#Delete old recorded entry if new entry is a duplicate

setopt MENU_COMPLETE
#Completes the first in list of ambiguous completions

bindkey -v
#Explicitly sets keys to vim mode

zstyle :compinstall filename '~/.zshrc'
#Load completions from this file since they are handled by oh-my-zsh

autoload -Uz compinit

#Checking the cached zcompdump can be slow making zsh startup slow
#Check only once an hour
if [[ -a $HOME/.zcompdump(#qN.mh+1) ]]; then
    compinit
else
    compinit -C
fi
#Enables zsh autocompletions of commands
#. ---------------------- #
# >>>>> END SETTINGS <<<<<#
#. ---------------------- #

#. ------------------------ #
# >>>>> USER SETTINGS <<<<< #
#. ------------------------ #
[[ $- != *i* ]] && return
#If not running interactively, don't do anything

PS1='[%n@%M %d]$ '

CDPATH=.:..:~:~/Git
#When type cd it will look for folder in cwd, parent, home, or git

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0  ]]; then
      BUFFER="fg"
      zle accept-line -w
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
#When ctrl-z out of vim can ctrl-z back in

set RANGER_LOAD_DEFAULT_RC false
#Dont want to load deafult AND mine, only mine

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
#Enable 'v' in normal mode to edit command line
#Edit commands by pressing v when in normal mode
#. --------------------------- #
# >>>>> END USER SETTINGS <<<<<#
#. --------------------------- #

#. ----------------------------- #
# >>>>> OH MY ZSH SETTINGS <<<<< #
#. ----------------------------- #
ZSH=/usr/share/oh-my-zsh
#Path to your oh-my-zsh installation.

ZSH_CUSTOM=~/.oh-my-zsh/custom
#Custom path for oh-my-zsh

ZSH_THEME="spaceship"
#Name of theme, can be "random"

CASE_SENSITIVE="false"
#Case sensitive completions are different commands

ENABLE_CORRECTION="false"
#Don't autocorrect

COMPLETION_WAITING_DOTS="true"
#Display red dots while waiting for completions

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh-cache
#Set cache location, create if doesn't exist

if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

plugins=(
 #fzf-zsh\
 #zsh-interactive-zsh
 #adb\
 archlinux\
 colored-man-pages\
 colorize\
 command-not-found\
 #common-aliases\
 dircycle\
 fasd\
 fd\
 fzf\
 git-prompt\
 git\
 globalias\
 gnu-utils\
 gpg-agent\
 history-substring-search\
 man\
 pip\
 pylint\
 python\
 ripgrep\
 rsync\
 ssh-agent\
 sudo\
 systemd\
 vi-mode\
 vim-interaction\
 zsh-autosuggestions\
 zsh-completions\
 zsh-navigation-tools\
 zsh_reload
)
#plugins can be found in ~/.oh-my-zsh/plugins/*
#Plugins can be found in ~/.oh-my-zsh/custom/plugins/* (NB. extension must be ".plugin.zsh")

bindkey "^[[A" history-substring-search-up
#Search through history with arrow keys

bindkey "^[[B" history-substring-search-down
#Search through history with arrow keys

source $ZSH/oh-my-zsh.sh
#Source oh-my-zsh for settings to take effect

spaceship_vi_mode_enable
#Explicitly enable vi mode

export KEYTIMEOUT=1
#By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered. This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.

bindkey "^[^M" autosuggest-accept
#Let me enter without needing to complete

#. ----------------------------------#
# >>>>> END OH MY ZSH SETTINGS <<<<< #
#. ----------------------------------#
#. ------------------ #
# >>>>> ALIASES <<<<< #
#. ------------------ #
alias archdatedisorder='pikaur --sync --refresh --sysupgrade --devel --rebuild --needed; pikaur --deptest; wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts; i3-msg "restart"'
alias add="archdatedisorder"
#Update command

alias archdate='pikaur --sync --refresh --sysupgrade --rebuild; pikaur --deptest; wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts; i3-msg "restart"; sudo updatedb'
alias ad="archdate"
#Update command

alias attach_monitor_right='xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x312 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --auto --pos 1366x0 --rotate normal'
#alias attach_monitor_left='xrandr --output LVDS1 --auto --primary --output HDMI-1-1 --auto --left-of LVDS-1'
#Attaches a second screen if it exists

alias bing_wallpaper="$HOME/Git/OneOffCodes/Python/wallpaper_maker/wallpaper_maker.py change_wallpaper --bing --quote-file $HOME/Git/OneOffCodes/Python/wallpaperMaker/quotes.txt"
#Set my bing wallpaper

alias calcadd='~/Git/OneOffCodes/Python/calcadd/calcadd.py'
#Add to my calendar

alias cf=". cf"
#Run cf in current process instead of subshell

alias latex_clean="find ./ -type f \( -name '*.aux' -o -name '*.bbl' -o -name '*.bcf' -o -name '*.blg' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' -o -name '*.out' -o -name '*.xml' -o -name '*.gz' -o -name '*.xdv' \) | xargs -I{} rm -f {} && latexmk -c"
alias lc='latex_clean'
#Remove lint latex files

#alias compile_latex='latexmk -xelatex -pvc -cd -quiet'
alias compile_latex='fd -e tex --max-depth 1 | entr -c -d latexrun -Wall /_'
alias cl='compile_latex'
#Compile and open latex

alias cpu="ps axch -o cmd,%cpu --sort=-%cpu | head"
alias mem="ps axch -o cmd,%mem --sort=-%mem | head"
#Outputs system stats

alias cx="chmod +x"
#Change mode of file

alias dd='sudo dd status=progress conv=fsync'
#alwas dd with same flags

alias dm='~/Git/OneOffCodes/Shell/dotmake'
alias dmd='dm desktop'
#Saves typing

alias du="ncdu --color dark -rr -x"
#Use a nicer du

alias failed_ctl='systemctl list-units --state=failed'
#To list any failed systemctl units

alias fd="/bin/fd --hidden --ignore-case --follow --show-errors --max-depth <++> '<regex>' <path> --exec '<command>'"
#Alias fd for me

alias fif="findinfile"
# using ripgrep combined with preview

alias flac2mp3='parallel ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: ./*.flac'
#Convert flac to mp3

alias gi="curl https://www.gitignore.io/api/vim,tex,linux,latex,python > .gitignore && echo '*.pdf' >> .gitignore"
#Create a gitignore file

alias git_push_all="~/Git/OneOffCodes/Shell/gitPushAll"
alias gtpa="~/Git/OneOffCodes/Shell/gitPushAll"
#Use script to push everything in all my repos

alias git_push='git add -p . && git commit -aS && git pull && git push'
alias gtp='git add -p . && git commit -aS && git pull && git push'
#Add, commit, and push git in one command

alias gif_make='$HOME/Git/OneOffCodes/Python/gifmaker/gifmaker.py make_gif'
#Make webms from videos

alias gpg_encrypt="~/Git/OneOffCodes/Shell/gpgEncrypt"
#GPG encrypt a file to the recipient and myself

alias hib24="sudo rtcwake --mode mem --seconds 86400; i3lock --color=000000 --ignore-empty-password --show-failed-attempts"
#Hibernate for 24 hrs

alias hs="wine .wine/drive_c/Program\ Files\ \(x86\)/Battle.net/Battle.net\ Launcher.exe"
#Launch Battle.net

alias ipython="/usr/bin/ipython --TerminalInteractiveShell.editing_mode=vi"
#Always open ipython with vim mappings

alias latex_shortcuts="cat $HOME/.vimrc | rg 'autocmd FileType tex inoremap.*' | cut -d';' -f2"
#Prints tha latex shortcuts I have in my vimrc

alias lock="~/Git/OneOffCodes/Shell/lock"
#Locks PC and mutes

alias lsa='exa --all --color always --color-scale'
#List all including hidden

alias ll='exa --all --color always --color-scale --long'
#List all including hidden in a long list

alias ls='exa --color always --color-scale'
#Colours in ls

alias mm='myman'
#Uses vimman instead of normal man

alias mkdir='mkdir -p'
#Create parent folders if doesnt exists

alias nb='killall newsboat; newsboat --import-from-file $HOME/GoogleDrive/01_Personal/04_Software/newsboatcache.txt; newsboat && newsboat --export-to-file $HOME/GoogleDrive/01_Personal/04_Software/newsboatcache.txt'
#Saves typing

alias nf="neofetch"
#Neofetch

alias nm='mailsync; neomutt'
#Saves typing

alias open="xdg-open"
alias o='fasd -a -e xdg-open' 
#Quick opening files with xdg-open

alias pg="prettyping --nolegend -c 5 google.com"
#Quick ping google.com

alias paorph='pacman --query --unrequired --deps --quiet'
alias po='paorph'
alias porm='paorph | xargs -I{} pikaur -R --noconfirm {}; paorph | xargs -I{} pikaur -R --noconfirm {}; paorph | xargs -I{} pikaur -R --noconfirm {}'
#Pacaur orphans

alias pdf2ocr="~/Git/OneOffCodes/Shell/ocr_pdf"
#Convert a pdf to tiff for tesseract and OCR it

alias play_DCAU="~/Git/OneOffCodes/Shell/playlistPlay ~/wynZFS/Media/WatchOrders/DCAU.order"
#Plays the next episode in the DCAU that I am up to

alias playlist_play="~/Git/OneOffCodes/Shell/playlistPlay"
#Use to play .order files so can watch overlapping shows in correct order. Searches and plays 1st line in a file. If multiples found presents them. Offers choice whether want to move played file to bottom
#Relys on custom 'lsgrep' function

alias pytest='~/Git/OneOffCodes/Shell/pytest'
#Watch my coding against the test

alias resetcaps='xmodmap -e "clear lock"; xmodmap -e "keycode 66 = Escape"; xmodmap -e "clear shift"; xmodmap -e "keycode 62 = Meta_L"; xmodmap -pke > ~/.Xmodmap'
#Sometimes Capslock loses its escape-ability

alias rm='trash -riv'
#Prompt when removing files, force recursive

alias rs="rsync --verbose --recursive --update --human-readable --partial --progress"
#I always use rsync with these flags

alias sab_ssh_tun='ssh -L 8080:localhost:8080 gouws.com.au -N'
alias sonar_ssh_tun='ssh -L 8081:localhost:8081 gouws.com.au -N'
alias torrent_ssh_tun='ssh -L 8082:localhost:8082 gouws.com.au -N'
#Create ssh tunnels to my localhosts

alias scim="sc-im"
#saves typing

alias shutdown_at="~/Git/OneOffCodes/Shell/shutdownAt"
#Allows user to enter shutdown_in hh:mm:ss and gives a countdown
alias shutdown_in="~/Git/OneOffCodes/Shell/shutdownIn"
#Allows user to enter shutdown_in hh:mm:ss and gives a countdown
alias shutdown="~/Git/OneOffCodes/Shell/dmenu_yn_prompt 'Do You want to shut down?' \"~/Git/OneOffCodes/Shell/shutdownIn 0:05\""
#Is the same as normal shutdown, except instead of just saying a min it counts down. Much more convenient

convert480p() { ffmpeg -i "$1" -vf scale=-2:480 -crf 20 -vcodec h264 -acodec libvorbis -ac 2 Small_"$1" }
#Convert a video to 576p

alias sleep_until="~/Git/OneOffCodes/Shell/sleep_until"
#Sleep until a certain time

alias sleeptonight='sudo rtcwake -m mem --date $(date -d tomorrow +%Y%m%d020000); shutdown_in 5:30:00'
#alias st='sleeptonight'
#Wake up at 2am, then shutdown at 730am

alias ss="sudo systemctl"
alias sss="sudo systemctl status"
alias ssr="sudo systemctl restart"
alias sse="sudo systemctl enable"
alias ssd="sudo systemctl disable"
#Saves typing

alias sv='sudo vim'
alias svim='sudo vim'
#Saves typing

alias p='pikaur -Ss'
#Minimize keystrokes
alias pare='pikaur -R'
#Remove package using pacman
alias pin='pikaur -S --noconfirm'
#Trizen install

alias ping='prettyping --nolegend'
#Use prettyping

alias time='hyperfine'
#Use hyperfine to time commands

alias tpoff='synclient "TouchpadOff"=1'
alias tpon='synclient "TouchpadOff"=0'
#Turns touchpad off and on

alias udm="udiskie-mount -a"
udum() {for folder in /run/media/wynand/*; do udiskie-umount --detach $folder ; done}
#Udiskie

alias unpw="cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:?=' | fold -w 8 | grep '[!@#$%^&*()_+{}|:?=]' | head -n 1; cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:?=' | fold -w 32 | grep '[!@#$%^&*()_+{}|:?=]' | head -n 1"
#Echo out a 8 char un and 32 char pw

alias v='vimfind' 
alias c='fasd_cd -d -i' 
#Quick opening files with vim

alias vd="_ systemctl stop --now openvpn.service"
alias vu="_ systemctl restart --now openvpn.service"
#Aliases for VPN up or down

alias youtube-ul="~/Git/OneOffCodes/Shell/youtubeUL"
alias ytul="youtube-ul"
#Uploads files to youtube

alias ytdl="youtube-dl --add-metadata"
#Youtube Upload

alias zsh_time='time "zsh -i -c exit"'
alias zt='zsh_time'
#Times my zsh load time
#. -------------------- #
# >>>>>END ALIASES<<<<< #
#. -------------------- #
 
#. ------------------- #
# >>>>> SOURCING <<<<< #
#. ------------------- #
## Init fasd from cache if it exists
fasd_cache=$XDG_CACHE_HOME/fasd-init-zsh
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| $fasd_cache
fi
source $fasd_cache
unset fasd_cache
#FASD

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
#FZF

eval "$(_MYMAN_COMPLETE=source_zsh myman)"
#My Scripts
#. ----------------------- #
# >>>>> END SOURCING <<<<< #
#. ----------------------- #
