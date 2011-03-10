[ -f ~/.bashrc ] && . ~/.bashrc


# Git commands 
alias pull='git pull origin master'

alias gp='git push origin'
alias gpm='git push origin master'
alias gs='git status'
alias gc='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff --stat'
alias gpo='git push origin'
alias gb='git branch'
alias gl='git log'

# Edit .gitignore
alias ge='gvim .gitignore'

function gg() {
  git add . && git commit -v -a -m "$*"
}

# Editera source
alias e='gvim ~/.bash_profile'

# Laddar om alla inställningar 
alias s='source ~/.bash_profile'

# PS1
function parse_git_branch {
#  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
#  echo "("${ref#refs/heads/}")"
  echo `(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')`
}

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="$RED\$(date +%H:%M) $BLACK\w $YELLOW\$(parse_git_branch) $BLACK\$$GREEN \n→$BLACK "


#chalmers login
alias chalmsshfs='sshfs rarash@remote1.student.chalmers.se:/chalmers/users/rarash/ ~/chalmers/'
alias chalmssh='ssh -Y rarash@remote1.student.chalmers.se'
