[ -f ~/.bashrc ] && . ~/.bashrc


# PS1
function parse_git_branch {
  echo `(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')`
}

function parse_git_branch_pretty {
  git status &> /dev/null
  if [ $? -le 1 ] # only print when in git directory
                  # chalmers school comps returns 1 not 0, so I've used <= 1 instead of == 0
  then
    echo -e " $PYELLOW{`parse_git_branch`}"
  fi
}

function parse_other {
  echo `git show --format=format:"%Cgreen {%Cblue%s %Cred%cr%Cgreen}" 2>/dev/null | head -1`
}

NO_COLOR='\e[0m' #disable any colors
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
PYELLOW="\033[0;33m"
GREEN="\[\033[0;32m\]"

PS1="\n$RED\$(date +%H:%M)$NO_COLOR \w\$(parse_git_branch_pretty)\$(parse_other)$NO_COLOR \$ $GREEN\n"
PS1="$PS1→ \[$NO_COLOR\]"


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

