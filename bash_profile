[ -f ~/.bashrc ] && . ~/.bashrc


# Git commands 
alias pull='git pull origin master'

#alias gp='git push origin'
alias gp="git push origin `parse_git_branch`"
alias gpm='git push origin master'
alias gs='git status'
alias gc='git checkout'
#alias gcp='git cherry-pick'
alias gd='git diff --stat'
alias gpo='git push origin'
alias gb='git branch'
alias gl='git log -n 10'

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
  echo `(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')`
}

function parse_other {
  echo `git show --format=format:"%Cgreen {%Cblue%s %Cred%cr%Cgreen}" 2>/dev/null | head -1`
}

NO_COLOR='\e[0m' #disable any colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="\n$RED\$(date +%H:%M)$NO_COLOR \w $YELLOW{\$(parse_git_branch)}\$(parse_other)$NO_COLOR \$ $GREEN\n"
PS1="$PS1→ \[$NO_COLOR\]"


#chalmers login
alias chalmsshfs='sshfs rarash@remote1.student.chalmers.se:/chalmers/users/rarash/ ~/chalmers/'
alias chalmssh='ssh -Y rarash@remote1.student.chalmers.se'
