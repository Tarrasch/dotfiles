new_or_attach () {
  # "New or ATtach" - my tmux workflow
  #
  # Usage:
  #
  # nat work-on-taxes
  tmux new -s $1 || tmux attach -t $1
}

# Autocompletion for existing sessions.
_new_or_attach () {
  reply=($(tmux list-sessions -F '#{session_name}' ))
}

compctl -V directories -K _new_or_attach new_or_attach 

minify-video () {
  # I got extremely pissed by that it took hours to find a decent way to just
  # make a ****ing video take less disk space.  So that I will not forget this
  # later, I just made this into a small zsh function. It seems to work, tested
  # on Ubuntu 14.04.

  # Usage:
  #
  # minify-video path/to/video.{MKV,MOV,etc.}
  local file_extension
  local dest_path
  file_extension="${1##*.}"
  dest_path="${1/.$file_extension/.mp4}"
  avconv -i $1 -strict experimental -vf 'scale=640:-1' $dest_path
  echo "Created file at $dest_path!"
}
