[ -f ~/.bashrc ] && . ~/.bashrc



# Linus 
# Linus 
# Linus 
# Linus 

alias pull='git pull origin master'

alias gp='git push origin master'
alias gs='git status'
alias gc='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff --stat'
alias gpo='git push origin'
alias gb='git branch'

# Laddar om alla inställningar //Linus
alias s='source ~/.bash_profile'

PS1='\n\w \n→ '


function gg() {
  git add . && git commit -v -a -m "$*"
}

alias ge='gvim .gitignore'

# Linus Oleander
# Linus 
# Linus 
# Linus 

# Editera source
alias e='gvim ~/.bash_profile'

# Starta train
alias setc='setup_course tda381'
alias runt='cd ~/ConcLabbar/Lab1/Trainspotting/Trainspotting/build/classes/ && 2 "tsim bana" "java Lab1 30 20"'
function runt2() {
 cd ~/ConcLabbar/Lab1/Trainspotting/Trainspotting/build/classes/ && 2 "tsim -s $1 bana" "java Lab1 10 5"
}


# comile-runna jr-program
function ja(){
 clear
 echo "Compiling $*"
 jrc *.jr 2>&1 | grep -v "^Note: "
 jr $*  2>&1 | grep -v "^Note: " 
}

function ja_(){
 clear
 echo "Compiling $*"
 jrc *.jr && jr $*
}

function ja2(){
 clear
 echo "Compiling $*"
 a = jrc *.jr 2>&1 | grep -v "^Note: "
 if [ "$a" ]; then
     jr $*  2>&1 | grep -v "^Note: " 
 fi
# a = jrc *.jr 2>&1 | grep -v "^Note: "
# if [ "$a" ]; then
#     jr $*  2>&1 | grep -v "^Note: " 
# fi

}


