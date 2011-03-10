[ -f ~/.bashrc ] && . ~/.bashrc


# Git commands 
alias pull='git pull origin master'

alias gp='git push origin master'
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

PS1='\n\w \n→ '


#chalmers login
alias chalmsshfs='sshfs rarash@remote1.student.chalmers.se:/chalmers/users/rarash/ ~/chalmers/'
alias chalmssh='ssh -Y rarash@remote1.student.chalmers.se'
