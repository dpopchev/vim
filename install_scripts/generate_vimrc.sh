#!/usr/bin/env bash
# 
# script to generate source based vimrc, e.g. each config file is sourced,
# rather than pasted; the leading config file should always be Init.vim

# if the script is started with more then one argument
# and it is the keyword 'debug' 
# then set the trace option for debugging purposes and shift the argument number
if [[ $# -gt 0 && $1 == "debug" ]]; then
    set -o xtrace
    shift 1
fi

# where to get the vim configs
VIM_SRC="$1"

# the main vim directory
VIM_TARGET=$(dirname "$1")

# string to be used as line prefix
LINE_PREFIX='" '

# string to be used as visual logical blocks separator
LINE_SEPARATOR=""
LINE_SEPARATOR+=$LINE_PREFIX
LINE_SEPARATOR+=$(printf '%.s-' {1..76})

_echo_config(){
    # automate the repetitive process of filling the vimrc file
    # parameter: 1 str, the vim filename with extension

    CNAME="${1%%.*}"    # config name (without extension)
    CFILE="${1}"        # config file name 

    # fill the vimrc file
    echo "${LINE_PREFIX}${CNAME}" >> "${VIM_TARGET}/vimrc"
    echo "${LINE_SEPARATOR}" >> "${VIM_TARGET}/vimrc"
    echo 'source $HOME/.vim/config/'"${CFILE}"  >> "${VIM_TARGET}/vimrc"
    echo "${LINE_SEPARATOR}" >> "${VIM_TARGET}/vimrc"
    echo "${LINE_PREFIX}end ${CNAME}" >> "${VIM_TARGET}/vimrc"
    echo "" >> "${VIM_TARGET}/vimrc"

    return 0
}

main(){

    # create a clean config file to fill
    echo -n "" > "${VIM_TARGET}/vimrc"

    # the first entry should be Init.vim
    _echo_config Init.vim

    # iterate recursively through $VIM_SRC to fill all vim configs
    # except the Init
    for fvim in `find ${VIM_SRC} \
                                -type f \
                                -name "*.vim" \
                                -a -not -name "Init.vim" \
                                -print`
    do
        _echo_config `basename "${fvim}"`
    done

    # make a backup of the old config, if present
    if [[ -f ${HOME}/.vimrc ]]
    then
        mv ${HOME}/.vimrc ${VIM_TARGET}/vimrc_$(date +%Y%m%d%H%M)
    fi

    mv ${VIM_TARGET}/vimrc ${HOME}/.vimrc

    return 0
}

main
