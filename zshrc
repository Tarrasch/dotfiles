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

# Add to path
PATH=~/.cabal/bin:$PATH
PATH=~/.bin:$PATH
PATH=~/repos/arcanist/bin:$PATH
PATH="/usr/lib/ccache:$PATH"  # http://askubuntu.com/a/470636/43106
PATH=~/sbt/bin:$PATH  # https://class.coursera.org/progfun-005/wiki/ToolsSetup
PATH=~/repos/problemtools:$PATH


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

# For some reasone I always had to enter my ssh-key all the time when I
# upgraded to 14.04. Ubuntu stopped doing keychain management for me
# automatically. Instead, I employ this cli-software instead.
eval $(keychain --eval --agents ssh id_rsa)
