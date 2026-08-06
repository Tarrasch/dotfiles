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

# Load my configs for zplug, which also initializes it.
. ~/.zsh/zplug.zsh

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
addpath ~/.local/bin  # July 2026: Contains useful stuff, like `uv` Python package manager.
addpath ~/.bin  # Custom programs


# Add to completions
fpath=(~/.zsh/plugins/completions/src $fpath)

## Command history configuration (from old oh-my-zsh config)
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

##############################
# July 2026: Would need to verify these...
# Key bidings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Due to tmux being weird
# http://clock.co.uk/blog/zsh-ctrl-left-arrow-outputting-5d
bindkey "5C" forward-word
bindkey "5D" backward-word

. ~/.zsh/plugin-configs.zsh

if (( ${+GOOGLE} )) && (( 1-${+GOOGLE_LAPTOP} ))
then
 . ~/.zsh/google.zsh
fi

# Always make last command successful. Note that all errors (but the very last
# command) is not going to be surfaced anyway.
# https://github.com/Tarrasch/dotfiles/commit/214274da5b8734d9806c7d968d9a217f621a1888
true
