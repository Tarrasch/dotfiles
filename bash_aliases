
#chalmers login
alias chalmsshfs='sshfs rarash@remote1.student.chalmers.se:/chalmers/users/rarash/ ~/chalmers/'
alias chalmssh='ssh -Y rarash@remote1.student.chalmers.se'

# Git commands 
alias pull='git pull origin master'
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


alias mk='yes | pdflatex *.tex'
alias mkf='for((i=0;i<1000000;i++)) do mk;sleep 5; done'

