HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000

# Allow extended glob patterns (like '**/' is actually '(*/)#')
setopt extended_glob

# Allow comments to be put in the command-line
#
#   $ echo 'Hello World'    # This comment will be valid now
#
# http://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments

# Add to path conditionally
#
# The idea is that I noticed my $PATH to contain clutter, and something output
# from "env" like programs makes me scrollblind as it shows irrelevant output.
#
# An by-arash-improved version of http://superuser.com/a/39995/97600
addpath () {
    if [[ -d "$1" ]] &&  [[ ":$PATH:" != *":$1:"* ]]
    then
        export PATH="$1:$PATH"
    fi
}
addpath ~/.cabal/bin
addpath ~/.bin
addpath ~/repos/arcanist/bin
addpath /usr/lib/ccache  # http://askubuntu.com/a/470636/43106
addpath ~/sbt/bin  # https://class.coursera.org/progfun-005/wiki/ToolsSetup
addpath ~/repos/problemtools/bin


# Add to completions
fpath=(~/.zsh/plugins/completions/src $fpath)

# Initialize colors
# Necessary for
#     $ echo "$fg[blue] hello world"
# Like is uesd in zsh-colors
autoload -U colors
colors

# Other modules we want to source
. ~/.zsh/zsh_aliases
. ~/.zsh/from-omz.zsh  # Import omz stuff

##############################
# Key bidings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Due to tmux being weird
# http://clock.co.uk/blog/zsh-ctrl-left-arrow-outputting-5d
bindkey "5C" forward-word
bindkey "5D" backward-word

# At VNG I had this problem when I sshed into their CentOS machines.  Both tmux
# and non-tmux was affected (in different ways). With these two lines, it seems
# like Home/End keys always work.
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# Initialize antigen-hs
. ~/.zsh/antigen-hs/init.zsh

# Python autocompletion (http://stackoverflow.com/a/246779/621449)
export PYTHONSTARTUP=~/.pythonrc


# -- Import VNG specific stuff --
# This should only be done from my work computer and the file might contain
# confidentialities and should therefor not be checked in!
[[ -s "$HOME/.zsh/vng.zsh" ]] && . ~/.zsh/vng.zsh

. ~/.zsh/util.zsh
. ~/.zsh/plugin-configs.zsh

. ~/.zsh/rsync.zsh

# For some reason I always had to enter my ssh-key all the time when I
# upgraded to 14.04. Ubuntu stopped doing keychain management for me
# automatically. Instead, I employ this cli-software instead.
# Nov 2015: Also only run conditionally if not sshing
[[ -z $SSH_TTY ]] && eval $(keychain --eval --agents ssh id_rsa)

# Make netbeans and stuff work with xmonad
# http://superuser.com/a/480682/97600
export _JAVA_AWT_WM_NONREPARENTING=1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/arashrk/.sdkman"
[[ -s "/home/arashrk/.sdkman/bin/sdkman-init.sh" ]] && source "/home/arashrk/.sdkman/bin/sdkman-init.sh"

# added by travis gem
[ -f /home/arashrk/.travis/travis.sh ] && source /home/arashrk/.travis/travis.sh

# added by Anaconda3 4.2.0 installer
export PATH="/home/arash/anaconda3/bin:$PATH"

# Always make last command successful. Note that all errors (but the very last
# command) is not going to be surfaced anyway.
# https://github.com/Tarrasch/dotfiles/commit/214274da5b8734d9806c7d968d9a217f621a1888
true
