# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source /etc/zsh_command_not_found
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# export EDITOR='vim'
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

eval "$(jump shell zsh)"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
         NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@" -e

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# alias ls='n -de'
export NNN_PLUG='n:nmount;f:finder;o:fzopen;c:fzcd;l:launch;p:preview-tabbed;t:preview-tui;d:dragdrop;v:imgview;x:togglex;e:-!sudo -E vim $nnn*;g:-!git diff;h:-!htop;i:!convert $nnn png:- | xclip -sel clipboard -t image/png*;j:autojump;s:gsconnect;r:pdfread;k:pskill;b:boom;m:mocq;y:moclyrics'
export NNN_FIFO=/tmp/nnn.fifo
# export NNN_COPIER=/usr/bin/copy
export NNN_BMS="d:$HOME/Downloads/;m:$HOME/MRT/;c:$HOME/Courses/;t:$HOME/Downloads/Telegram Desktop/;"

find-pdf(){
find ${2:-.} -iname '*.pdf' -exec pdfgrep "$1" {} + | grep -shoP '.*?\.pdf' | sed "s/^/'/;s/$/'/"| xargs zathura
}

xdotype() {
sleep ${2:-1.5}; xdotool type $1;
}

s-venv() {
source $1/bin/activate
}

keep-alive(){
until $1; do
    echo "Server $1 crashed with exit code $?.  Respawning.." >&2;
    sleep 2;
done;
}

to-mp4(){
for i in *.${1:-flv}; do ffmpeg -i "$i" -c copy -copyts "${i%.*}.mp4"; done
}

get-subs(){
for i in *.${1:-mkv}; do ffmpeg -i "$i" -map 0:s:0 "${i%.*}.srt"; done
}

to-mp3(){
for i in *.${1:-mpga}; do ffmpeg -i "$i" -vn -ar 44100 -ac 2 -b:a 192k "${i%.*}.mp3"; done
}

reduce-mp4(){
for i in *.mp4; do ffmpeg -i "$i" -vcodec libx265 -crf 28 "${i%.*}-reduced.mp4"; done
}

change-speed(){
ffmpeg -i $1 -filter:v "setpts=$4*PTS/$3" -an $2
}

docker-bash(){
docker exec -it $1 /bin/bash
}

#just for ref, use 'tree' or 'tree -d' instead
alias file-tree="find | sed 's|[^/]*/|- |g'"
alias dir-tree='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/| - \1/"'
# alias tt="ttyper"
alias vimrc="vim ${HOME}/.vimrc" 
# alias vim='/usr/bin/vim --servername vimd'

alias .-ros2rolling="source ~/ros2_galactic/install/setup.zsh"
alias .-ros="source /opt/ros/noetic/setup.zsh"
alias .-ws="source devel/setup.zsh"
alias .-ros2galactic="source /opt/ros/galactic/setup.zsh"
alias .-dev_ws="source ~/dev_ws/install/local_setup.zsh"
alias r-echo="rostopic echo"

alias get="sudo apt install"
# alias bt="sudo service bluetooth restart"
alias pw="systemctl --user daemon-reload; systemctl --user --now enable pulseaudio.service pulseaudio.socket; systemctl --user --now disable pulseaudio.service pulseaudio.socket; systemctl --user --now enable pipewire pipewire-pulse"

alias goodbye="sudo shutdown now"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
