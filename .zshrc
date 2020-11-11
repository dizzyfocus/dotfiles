# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH:~/google-cloud-sdk/bin

source <(kubectl completion zsh)
bindkey -v

# Path to your oh-my-zsh installation.
export ZSH="/Users/pericles/.oh-my-zsh"
export PYTHONSTARTUP=$HOME/projects/dizzyfocus/dotfiles

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="avit"
ZSH_THEME="agnoster"
vsed(){
  search=$1
  replace=$2
  shift
  shift
  vim-c "bufdo! set eventignore-=Syntax| %s/$search/$replace/gce" $*
}
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#set -o vi
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
plugins+=(kube-aliases)
rcloudu() { ssh cloud_user@$1; }
rcopyid() { ssh-copy-id cloud_user@$1; }
relasticcloud() { scp elastic.stack.install.sh cloud_user@$2:~; }
# svn
export SVN_EDITOR="/usr/bin/vim"
# make sure we are using the latest vi
alias k=kubectl
alias vi="/usr/bin/vim"
alias showtraf='lsof -i'
alias rkkmaster1='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/master-1/virtualbox/private_key vagrant@192.168.5.11'
alias rkkmaster2='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/master-2/virtualbox/private_key vagrant@192.168.5.12'
alias rkklb='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/loadbalancer/virtualbox/private_key vagrant@192.168.5.30'
alias rkkworker1='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/worker-1/virtualbox/private_key vagrant@192.168.5.21'
alias rkkworker2='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/worker-2/virtualbox/private_key vagrant@192.168.5.22'
#alias chkjboss="ssh $1 'ps faux | grep java'"
# no core dumps
ulimit -S -c 0        # Don't want any coredumps

# set
#shopt -u mailwarn
#unset MAILCHECK       # I don't want my shell to warn me of incoming mail

# Bitchx and irssi settings
export HISTIGNORE="&:bg:fg:ll:h"

# amazon
alias ramazon='ssh -i "/Volumes/untitled/amazon/Ross.pem" ec2-user@ec2-52-55-223-196.compute-1.amazonaws.com'
