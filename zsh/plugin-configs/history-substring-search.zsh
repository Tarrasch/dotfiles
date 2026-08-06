# 2. Keybindings for Konsole (MUST BE BELOW 'zplug load')
if [[ -n "$terminfo[kcuu1]" && -n "$terminfo[kcud1]" ]]; then
  # Robust terminfo bindings (Handles Konsole's keyboard modes)
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
else
  # Fallback standard escape sequences if terminfo isn't loaded
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# It seems that I need this for the evremap up/down keys to work (thank you Gemini)
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
