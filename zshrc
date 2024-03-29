# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nano'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#
# # ex - archive extractor
# # usage: ex <file>
#
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH=$HOME/Sysorg/Scripts:$HOME/.local/bin:$GOPATH/bin:$HOME/wps-office/:$PATH
export ANDROID_HOME=$HOME/Android
setopt INC_APPEND_HISTORY

alias clr="clear"
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cd..='cd ..'
alias sock='ssh -D 51820 -q -C -N -f umang@umangparmar.me -p 36547'
alias killsock='killall -9 ssh'
alias amend='git commit --amend'
alias fuck='sudo pacman -Syu'
alias aurfuck='yay -Syu'
alias cd..='cd ..'
alias rcp="rsync --verbose --progress --partial"

merge_ups() {
	git fetch upstream
	if [ "$#" -eq 0 ]; then
		git merge upstream/master
	else
		git merge "$1"
	fi
}

gpush() {
	git add .
	git commit -m "${1}"
	git push origin master
}

readb() {
	sudo adb kill-server
	sudo adb start-server
	adb devices
}

dl3(){
	youtube-dl --extract-audio --audio-format mp3 $1 -f 'bestaudio'
}

unotes() {
	if [ $# -eq 0 ]; then
     		echo "No arguments supplied"
   	elif [[ $1 -eq "push" ]]; then
     		msg="Add notes for ""$(date +%d-%m-%Y)"
     		$(cd ~/Documents/unotes; git pull; git add .; git commit -m $msg; git push origin master)
   	else
     		"$EDITOR" "~/Documents/unotes/""$1"".txt"
   	fi
}

dns_flush_osx() {
	sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache
}

play_random() {
	vlc --LZ $1
}

# git aliases
alias push="git push"
alias pull="git pull"
alias yyb="yarn && yarn build"
alias yy="yarn"
alias yb="yarn build"
alias gyb="gl && yarn && yarn build"

alias gcla="git submodule foreach 'git checkout launchpad || :'"
alias gcll="git submodule foreach 'git pull || :'"
alias gclal="git submodule foreach 'git checkout launchpad || :' && git submodule foreach 'git pull || :'"
