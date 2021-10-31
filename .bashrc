# .bashrc

# color Variables
COLOR_RED_BOLD="\[\e[31;1m\]"
COLOR_GREEN_BOLD="\[\e[32;1m\]"
COLOR_NONE="\[\e[0m\]"

# git stuff
export ZSH_VERSION=null

# completetion

# chkjboss function
chkjboss () { ssh -i ~/.ssh/id_rsa_jboss jbadmin@"$@" "ps faux | grep java"; }
ssj () { ssh -i ~/.ssh/id_rsa_jboss jbadmin@"$@"; }

#export GIT_PS1_SHOWDIRTYSTATE=1
# export PYTHONSTARTUP=$HOME/projects/dizzyfocus/dotfiles

# prompt function
promptFunc()
{
    PREV_RET_VAL=$?;

    PS1=""

    PS1="${PS1}\e[1;30m[\e[1;34m\u@\H\e[1;30m:\e[0;37m \e[0;32m\d \T\e[1;30m]\e[1;37m \w\e[0;37m\[\033]0; \w - \u@\H \007\]\n\[\] $(__git_ps1 " (%s)")  "

    if test $PREV_RET_VAL -eq 0
    then
        PS1="${PS1}${COLOR_GREEN_BOLD}\\$ ${COLOR_NONE}"
    else
        PS1="${PS1}${COLOR_RED_BOLD}\\$ [${PREV_RET_VAL}] ${COLOR_NONE}"
    fi
}
# 10/22/14 - never forget

PROMPT_COMMAND=promptFunc

# some misc vars
# Path
export PATH=/usr/local/bin:$PATH:$HOME/bin

#functions
rcloudu() { ssh cloud_user@$1; }
rcopyid() { ssh-copy-id cloud_user@$1; }

# svn
export SVN_EDITOR="/usr/bin/vim"
# make sure we are using the latest vi
alias k=kubectl
alias vi="/usr/bin/vim"
alias rnagios="ssh rrfomeran@amanagiosl001"
alias showtraf='lsof -i'
alias rdosomething='ssh bender@192.168.254.24'
alias rsandbox='ssh cloud_user@13.57.243.199'
alias rmaster01='ssh -i /Users/pericles/projects/kubernetes-the-hard-way/vagrant/.vagrant/machines/master-1/virtualbox/private_key vagrant@192.168.5.11'
#alias chkjboss="ssh $1 'ps faux | grep java'"
# no core dumps
ulimit -S -c 0        # Don't want any coredumps

# set
set -o notify
set -o ignoreeof
set -o nounset
# vi mode
set -o vi
#set -o xtrace        # Useful for debuging

# enable options
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s no_empty_cmd_completion  # bash>=2.04 only
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob      # Necessary for programmable completion

# Disable options:
shopt -u mailwarn
#unset MAILCHECK       # I don't want my shell to warn me of incoming mail

# Bitchx and irssi settings
export HISTIGNORE="&:bg:fg:ll:h"

# .examples

alias x-bind='less "$HOME/.examples/x-bind"'
alias x-dns='less "$HOME/.examples/x-dns"'
alias x-git='less "$HOME/.examples/x-git"'
alias x-http-codes='less "$HOME/.examples/x-http-codes"'
alias x-kill-signals='less "$HOME/.examples/x-kill-signals"'
alias x-media-wiki='less "$HOME/.examples/x-media-wiki"'
alias x-ruby='less "$HOME/.examples/x-ruby"'
alias showvirt='echo "Platform: $(lspci |grep "System peripheral" | cut -d":" -f3)"'
