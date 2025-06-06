#!/bin/bash

#set -x

if [ $EUID -ne 0 ]; then
	echo "This script sudo required"
	echo "sudo $0 $1"
        echo "chmod +x $0"
	exit 1
fi	

sbg="\e[7;1m"
ebg="\e[m"

sdbg="\e[7;3m"
df="\e[3m"


echo -e "$sbg Which $ebg $sdbg(search executable path or shell promt)$ebg"

which -a ls 2>/dev/null

if [ $? != 0 ]; then
	echo -e "\t$df Which -a ls is not work $ebg"
else
	which -a $1
fi	

echo -e "$sbg Whereis $ebg $sdbg(source location and documentation)$ebg"

whereis ls 2>/dev/null

if [ $? != 0 ]; then
	echo -e "\t $df Whereis is not work $ebg"
else
	whereis $1 | sed 's/ /\n/g'
fi

echo -e "$sbg Apropos $ebg $sdbg(manual pages)$ebg"

apropos ls 2>/dev/null

if [ $? != 0 ]; then
	echo -e "\t $df Apropos is not work $ebg"
else
	apropos -f $1
fi

echo -e "$sbg Locate $ebg $sdbg(file locations)$ebg"

locate ls 2>/dev/null

if [ $? != 0 ]; then
	echo -e "\t $df Locate is not work $ebg"
else
	locate $1
fi

echo -e "$sbg History $ebg $sdbg(from history files)$ebg"

history 2>/dev/null

if [ $? != 0 ]; then
	echo -e "\t $df History is not work $ebg"
else
	echo -e "\t $df History: $ebg"
	cat ~/.bash_history | grep -in $1
 	cat /root/.bash_history | grep -in $1
	echo -e "\t $df History files: $ebg"
	find -H /root /home /usr/bin -type f -name '*history*' -exec grep -iwHn $1 {} \; -nowarn
fi

echo -e "$sbg Log $ebg $sdbg(from log files)$ebg"

find /var/log -type f -name '*.log' -exec grep -iwHn $1 {} \; -nowarn

