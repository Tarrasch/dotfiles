HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000

# TODO: Make more discrete ?
if [[ "$HOME" =~ "rouhani" ]]
then
 GOOGLE='yep, set in .zshrc'
 if ! [[ "$HOME" =~ "usr" ]]
 then
   GOOGLE_LAPTOP='yep, set in .zshrc'
 fi
fi

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
addpath ~/.local/bin
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

# Initialize antigen-hs
. ~/.zsh/antigen-hs/init.zsh

# Python autocompletion (http://stackoverflow.com/a/246779/621449)
export PYTHONSTARTUP=~/.pythonrc

. ~/.zsh/util.zsh
. ~/.zsh/plugin-configs.zsh

. ~/.zsh/rsync.zsh

# For some reason I always had to enter my ssh-key all the time when I
# upgraded to 14.04. Ubuntu stopped doing keychain management for me
# automatically. Instead, I employ this cli-software instead.
# Nov 2015: Also only run conditionally if not sshing
(( ! ${+GOOGLE} )) && [[ -z $SSH_TTY ]] && eval $(keychain --eval --agents ssh id_rsa)

# Make netbeans and stuff work with xmonad
# http://superuser.com/a/480682/97600
export _JAVA_AWT_WM_NONREPARENTING=1

if (( ${+GOOGLE} )) && (( 1-${+GOOGLE_LAPTOP} ))
then
 . ~/.zsh/google.zsh
fi

# Always make last command successful. Note that all errors (but the very last
# command) is not going to be surfaced anyway.
# https://github.com/Tarrasch/dotfiles/commit/214274da5b8734d9806c7d968d9a217f621a1888
true
