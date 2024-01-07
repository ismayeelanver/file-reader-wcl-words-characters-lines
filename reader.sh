#!/bin/bash

# Copyright 2024
# test.sh
# main() {
# $everything
# }

# the purpose of this script is to read files
# with various options
# the goal of this script is to say to the user that
# options can be used
# set optstring
optstring=":lwch"
while getopts "$optstring" arg; do
	case $arg in
	w)
		file="$2"
		if [ -d $file ]; then
			echo "$file is a directory"
		elif ! [ -f $file ]; then
			echo "$file does not exist"
		fi
		echo your file has $(cat $file | wc -w) words
		;;
	l)
		file="$2"
		if [ -d $file ]; then
			echo "$file is a directory"
			exit
		elif ! [ -f $file ]; then
			echo "$file does not exist"
			exit
		fi
		echo your file has $(cat $file | wc -l) lines
		;;
	c)
		file="$2"
		if [ -d $file ]; then
			echo "$file is a directory"
		elif ! [ -f $file ]; then
			echo "$file does not exist"
		fi
		echo your file has $(cat $file | wc -c) characters
		;;
	h)
		echo "usage: test.sh [-w] [-l] [-c] [-h]"
		echo "if permisson is denied, use sudo test.sh [-w] [-l] [-c] [-h]"
		;;
	*)
		echo "usage: test.sh [-w] [-l] [-c] [-h]"
		echo "if permisson is denied, use sudo test.sh [-w] [-l] [-c] [-h]"
		;;
	esac
done
