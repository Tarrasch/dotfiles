
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
alias gl='git log -5 --format="%C(yellow)%h %Creset%s %Cred(%ar)"'

# Edit .gitignore
alias ge='gvim .gitignore'

# Add template .gitignore
alias makegitignore='cp ~/dotfiles/.files/.gitignore/ .' #otestad!

function gg() {
  git add . && git commit -v -a -m "$*"
}

# Editera source
alias e='gvim ~/.bash_profile'

# Laddar om alla inställningar 
alias s='source ~/.bash_profile'

# jobba med latex
alias mk='yes | pdflatex *.tex'
alias mkf='for((i=0;i<1000000;i++)) do mk;sleep 5; done'

# yesod
alias yc='yesod configure'
alias yd='yesod devel'

# dtek
alias dtek='ssh rarash@dtek.se'

