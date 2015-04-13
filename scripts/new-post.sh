#!/bin/bash
#----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 43):
# <nellyk89@gmail.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Nelson Kigen
# ----------------------------------------------------------------------------


header(){
echo "---"
echo "layout: post"
echo "title: "$1
echo "---"
}

main(){
header "$1"
}

main "$@"
