source /etc/bash_completion.d/g4d

reply_to_cl () {
  stubby --proto2 call blade:codereview-rpc CodereviewRpcService.PublishComments "changelist_number: $1"
}

get_just_cl_number () {
  cl_num=$1
  # Remove "http://"
  if [[  $cl_num[1] == "h"  ]]
  then
    cl_num=${cl_num:7}
  fi
  # Remove "cr/" or "cl/"
  if [[  $cl_num[1] == "c"  ]]
  then
    cl_num=${cl_num:3}
  fi
  echo $cl_num
}

presubmit_and_reply() {
  if (( $# != 1 ))
  then
    echo "expected exactly 1 param."
    return 1
  fi
  rev_specifier=$1
  cl_num=$(get_just_cl_number $rev_specifier)

  echo "Using rev_specifier $rev_specifier and cl_num $cl_num"
  if (( $# > 0 ))
  then
    echo "Using params to presubmit: $@"
  fi
  hg presubmit --rev "$rev_specifier" $@ && reply_to_cl $cl_num
}

presubmit_and_mail() {
  rev_specifier=$1

  echo "Using rev_specifier $rev_specifier"
  shift 1
  if (( $# > 0 ))
  then
    echo "Using params to presubmit and mail command: $@"
  fi
  hg presubmit --rev "$rev_specifier" $@ && hg mail --disable-presubmit --rev "$rev_specifier" $@
}


presubmit_reply_and_submit() {
  cl_num=$(get_just_cl_number $1)
  echo "Using cl_num $cl_num"
  if (( $# > 0 ))
  then
    echo "Using params to presubmit and submit command: $@"
  fi

  hg presubmit --rev "cl/$cl_num" $@ && reply_to_cl $cl_num && hg submit --rev "cl/$cl_num" $@
}


new_or_attach_piper () {
  local workspace
  [[ $PWD =~ '.*/rouhani/([^/]*)/.*' ]] && workspace=$match[1]
  new_or_attach $workspace
}

work () {
  g4d $1
  new_or_attach_piper
}

gcert() {
  /usr/bin/gcert "$@" &&
    /google/data/ro/users/di/diamondm/engfortunes/fortune.sh --extra_space --android_say
}


alias mendelbrot='/usr/bin/mendel --frontend=youtube'

source /etc/bash_completion.d/hgd

# This is supposed to give me more autocompletions (added Oct 2020)
BLAZE_COMPLETION_USE_QUERY=true

# http://go/fig-glossary#chg
alias hg='chg'
