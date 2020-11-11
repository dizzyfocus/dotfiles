# .bashrc

# color Variables
COLOR_RED_BOLD="\[\e[31;1m\]"
COLOR_GREEN_BOLD="\[\e[32;1m\]"
COLOR_NONE="\[\e[0m\]"

# git stuff
export ZSH_VERSION=null
. ~/bin/git-prompt.sh

# completetion

# chkjboss function
chkjboss () { ssh -i ~/.ssh/id_rsa_jboss jbadmin@"$@" "ps faux | grep java"; }
ssj () { ssh -i ~/.ssh/id_rsa_jboss jbadmin@"$@"; }

export GIT_PS1_SHOWDIRTYSTATE=1

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

# alias's for connecting to carecentrix boxes

# gold image
alias rgold='ssh 10.230.108.231'

# git

alias rgit='ssh amagitserverl001'

# q1 dmz
alias rq1dmzhbpaitentws1='ssh 10.100.57.29'

# dev
#tidal
alias rdtidalauto1='ssh DAPTIDALAUTOL001'

# dbs
alias rdboramstr01='ssh oramstr01'
alias rdboramstr02='ssh oramstr02'
alias rdboramstr03='ssh oramstr03'
alias rdboramstr03b='ssh oramstr03b'
alias rdboramstr04='ssh oramstr04'
alias rdboramstr05='ssh oramstr05'
alias rdbq3rac1='ssh qdboraracl001.rac-qa'
alias rdbq3rac2='ssh qdboraracl002.rac-qa'
alias rdbq3rac3='ssh qdboraracl003.rac-qa'
alias rdbq3rac4='ssh qdboraracl004.rac-qa'
#ccxq
alias rq1ppl='ssh qapppll001'
alias rq1qm1='ssh qapqml001'
alias rq1cps1='ssh qapcpsl001'
alias rq1lps1='ssh qaplpsl001'
alias rq1ncc1='ssh qapnccl001'
alias rq1rcc1='ssh qaprccl001'
alias rq1trans1='ssh qaptransl001'
alias rq1cnm1='ssh qapcnml001'
alias rq1brms1='ssh qapbrmsl001'
alias rq1claimsvc='ssh qapclaimsvcsl001'
alias rq1ctp='ssh qapctpl001'
alias rq1pclaims='ssh qappclaimsl001'
alias rq1websvcs1='ssh qapwebsvcsl001'

# ccxq2

alias rq2qm1='ssh qapquemgrl001'
alias rq2qm2='ssh qapquemgrl002'
alias rq2jbpm='ssh q2-jbpm-1'
alias rq2elig='ssh qapppseligl001'
alias rq2ncc='ssh qapq2nccl001'
alias rq2rcc='ssh qapq2rccl001'
alias rq2cnm='ssh qapq2cnml001'
alias rq2claimsvcs1='ssh qapq2claimsvcsl001'
alias rq2ppl='ssh qapprovportl001'
alias rq2ctp='ssh qapppsctpl001'
alias rq2paper1='ssh qaq2pclaimsl001'
alias rq2paper2='ssh qaq2pclaimsl002'
alias rq2auth1='ssh q2-authsvcs-1'
alias rq2auth2='ssh q2-authsvcs-2'
alias rq2ptnt1='ssh q2-ptntsvcs-1'
alias rq2ptnt2='ssh q2-ptntsvcs-2'
alias rq2waa1='ssh q2-websvcs-1'


#ccxq3
alias rq3ptnt1='ssh qapq3ptntsvcsl001'
alias rq3ptnt2='ssh qapq3ptntsvcsl002'
alias rq3brms='ssh qapq3brmsl001'
alias rq3claims='ssh qapq3claimsvcl001'
alias rq3cnm='ssh qapq3cnmrulesl001'
alias rq3cps='ssh qapq3cpsl001'
alias rq3ctp='ssh qapq3ctpl001'
alias rq3elig='ssh qapq3eligl001'
alias rq3lps='ssh qapq3lpsl001'
alias rq3ncc='ssh qapq3nccrulesl001'
alias rq3pclaims='ssh qapq3pclaimsl001'
alias rq3ppl='ssh qapq3provportl001'
alias rq3qm='ssh qapq3quemgrl001'
alias rq3rcc='ssh qapq3rccrulesl001'
alias rq3sleep='ssh qapq3ssuml001'
alias rq3trans='ssh qapq3transl001'

#ccxq4
alias rq4ppl1='ssh qapperfppll001'
alias rq4ppl2='ssh qapperfppll002'
alias rq4qm1='ssh qapperfqml001'
alias rq4qm2='ssh qapperfqml002'
alias rq4elig='ssh qapperfeligl001'
alias rq4lps='ssh qapperflpsl001'
alias rq4ncc='ssh qapperfnccl001'
alias rq4rcc='ssh qapperfrccl001'
alias rq4trans1='ssh qapperftransl001'
alias rq4trans2='ssh qapperftransl002'
alias rq4cnm1='ssh qapperfcnmrulesl001'
alias rq4cnm2='ssh qapperfcnmrulesl002'
alias rq4pclaims='ssh qapperfpclaimsl001'
alias rq4brms='ssh qapperfbrmsl001'
alias rq4claimsvcs1='ssh qapperfclaimsvcsl001'
alias rq4claimsvcs2='ssh qapperfclaimsvcsl002'
alias rq4sleepum='ssh qapperfsuml001'
alias rq4ptnt1='ssh qapperfptntsvcsl001'
alias rq4ptnt2='ssh qapperfptntsvcsl002'
alias rq4elig3='ssh qapperfeligl003'
alias rq4elig4='ssh qapperfeligl004'

# oracle
alias rora11='ssh oramstr11'


#hadoop
alias rhadoop1='ssh tdbhadoopl001'
alias rhadoop2='ssh tdbhadoopl002'

# administration
alias raconfmgr1='ssh amaconfmgmtl001'
alias raconfmgr2='ssh amaconfmgmtl002'
alias raconfmgr3='ssh amaconfmgmtl003'
alias radeploy1='ssh amadeployl001'


# alias's for connecting to rac cluster hosts

alias rq3rac1="ssh qdboraracl001"
alias rq3rac2="ssh qdboraracl002"
alias rq3rac3="ssh qdboraracl003"
alias rq3rac4="ssh qdboraracl004"

# alias's for util boxes

alias rnagios="ssh nagios -p 7779"
alias rasat6='ssh rhn-satellite.ccx.carecentrix.com'

# prod

# JBPM

alias rpjbpm1="ssh papjbpml001"
alias rpjbpm2="ssh papjbpml002"

# CNM

alias rpcnm1="ssh papcnml001"
alias rpcnm2="ssh papcnml002"
alias rpcnm3="ssh papcnml003"
alias rpcnm4="ssh papcnml004"
alias rpcnm5="ssh papcnml005"
alias rpcnm6="ssh papcnml006"

# Claims Web

alias rpclaims1="ssh papclaimsvcsl001"
alias rpclaims2="ssh papclaimsvcsl002"
alias rpclaims3="ssh papclaimsvcsl003"
alias rpclaims4="ssh papclaimsvcsl004"

# QM

alias rpqm1="ssh papqml001"
alias rpqm2="ssh papqml002"
alias rpqm3="ssh papqml003"
alias rpqm4="ssh papqml004"
alias rpqm5="ssh papqml005"
alias rpqm6="ssh papqml006"
alias rpqm7="ssh papqml007"

# WAA

alias rpwaa1="ssh papwaawebsvcsl001"
alias rpwaa2="ssh papwaawebsvcsl002"

# ELIG

alias rpelig1="ssh papeligl001"
alias rpelig2="ssh papeligl002"
alias rpelig3="ssh papeligl003"
alias rpelig4="ssh papeligl004"
alias rpelig5="ssh papeligl005"
alias rpelig6="ssh papeligl006"

# NCC

alias rprncc1="ssh papnccl001"
alias rprncc2="ssh papnccl002"
alias rprncc3="ssh papnccl003"

# RCC

alias rprrcc1="ssh paprccl001"
alias rjprrcc2="ssh paprccl002"
alias rprrcc3="ssh paprccl003"
alias rprrcc4="ssh paprccl004"
alias rprrcc5="ssh paprccl005"
alias rprrcc6="ssh paprccl006"
alias rprrcc7="ssh paprccl007"
alias rprrcc8="ssh paprccl008"
alias rprrcc9="ssh paprccl009"
alias rprrcc10="ssh paprccl010"

# PTNT

alias rprptnt1="ssh papptntsvcsl001"
alias rprptnt2="ssh papptntsvcsl003"

# AUTH

alias rprauth1="ssh papptntsvcsl002"
alias rprauth2="ssh papptntsvcsl004"

# Paper Claims

alias rprpclaims1="ssh papclaimsvcsl001"
alias rprpclaims2="ssh papclaimsvcsl002"

# Portal

alias rprppl1="ssh papppll001"
alias rprppl2="ssh papppll002"
alias rprppl3="ssh papppll003"
alias rprppl4="ssh papppll004"
alias rprppl5="ssh papppll005"
alias rprppl6="ssh papppll006"
alias rprppl7="ssh papppll007"
alias rprppl8="ssh papppll008"

# Temp cloud server creds

alias rocpmaster='ssh cloud_user@18.144.50.95'
alias rocpworker1='ssh cloud_user@54.193.27.110'
alias rocpworker2='ssh cloud_user@54.219.183.19'

alias rocpinfra='ssh cloud_user@54.193.27.110'
alias rocpcompute='ssh cloud_user@54.219.183.19'
# .examples

alias x-bind='less "$HOME/.examples/x-bind"'
alias x-dns='less "$HOME/.examples/x-dns"'
alias x-git='less "$HOME/.examples/x-git"'
alias x-http-codes='less "$HOME/.examples/x-http-codes"'
alias x-kill-signals='less "$HOME/.examples/x-kill-signals"'
alias x-media-wiki='less "$HOME/.examples/x-media-wiki"'
alias x-ruby='less "$HOME/.examples/x-ruby"'
alias showvirt='echo "Platform: $(lspci |grep "System peripheral" | cut -d":" -f3)"'
if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

alias ramazon1='ssh -i "Ross.pem" ec2-user@ec2-52-55-223-196.compute-1.amazonaws.com'
