#!/bin/bash

GLADOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$GLADOS_DIR/pipeline.sh"

ascii(){
	cat << "EOF"
   ________          ____  ____  _____
  / ____/ /   ____ _/ __ \/ __ \/ ___/
 / / __/ /   / __ `/ / / / / / /\__ \ 
/ /_/ / /___/ /_/ / /_/ / /_/ /___/ / 
\____/_____/\__,_/_____/\____//____/  

EOF
}

help(){
	cat << "EOF"
GLaDOS - System utility

Usage:
    glados [FLAGS]

FLAGS:
    -d      Domain to be used as argument for the pipeline
    -c      Display GLaDOS menu
    -h      Display this help message

Examples:
    glados -d example.com
    glados -c
    glados -h
EOF
}

if [ "$#" -eq 0 ]; then
    echo "[!] No command provided. Use -h for help."
    help
    exit 0
fi

ascii

while getopts 'hd:c' option; do
	case $option in
		h)	help
			;;
		d)	domain="$OPTARG"
			pipeline "$domain"
			;;
		c)	exit 0;
			;;
	esac
	exit 0;
done

