#!/bin/bash

_superbuild_sh_complete ()
{            
  local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="branch_list branch_status branch_to_push"


    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

complete -F _superbuild_sh_complete -o filenames superbuild
