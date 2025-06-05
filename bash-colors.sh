#!/bin/bash

echo "Args: $@"

if [ $# -eq 0 ]; then
	echo -e "Два или один аргумент цифрой"
	echo -e "Цифра первая что-то и цифра вторая, также, что-то"
	echo -e "Doing something..."
	exit 1
fi

if [ $# -eq 1 ]; then
	echo -e "\e[$1m Test \e[m"
elif [ $# -eq 2 ]; then
	echo -e "\e[$1;$2m Test \e[m"
fi
