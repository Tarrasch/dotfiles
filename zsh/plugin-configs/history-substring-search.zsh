# bind UP and DOWN arrow keys for zsh-history-substring-search
zmodload zsh/terminfo

# July 2022 test: what happens if I comment them out...
# # It seems like the following works good for Ubuntu 13.10+,
# # I've now removed all intelligent version checking, because
# # at the time of writing all older versions are now history.
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

# Google: What I used to had at Spotify... hmmm
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
