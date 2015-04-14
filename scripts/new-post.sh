#!/bin/bash
#----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 43):
# <nellyk89@gmail.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Nelson Kigen
# ----------------------------------------------------------------------------

POST_HOME="../_posts"
header(){
	[ -f $2 ] && echo "File Already exists" && exit 1
	echo "---" > "$2"
	echo "layout: post" >> "$2"
	echo "hidden: true" >> "$2"
	echo "title: "$1 >> "$2"
	echo "---" >> "$2"
}

main(){
	DATE=`date +%Y-%m-%d`
	for word in $1
		do
			DATE=${DATE}"-"${word}
	    done
	header "$1" $POST_HOME/$DATE".md"
}

main "$@"
