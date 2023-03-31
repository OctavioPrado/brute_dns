#!/usr/bin/env bash

#	Program Tests
#######################
[[ $(type -p dig) ]] || { echo -e "\033[37;1mNeeds dig to execute this script!\033" ; exit 1;} # Test to see if the user have dig installed

if [[ -z "$1" ]]; then
	echo -e "\033[37;1m
Use Mode

$0 [Url] [Options]

-h for help
\033[m"
exit 0
fi
#######################


echo -e " \033[31m
  ____                       _
 / ___|___  _ ____   _____  | |  ___  ___
| |   / _ \| '__\ \ / / _ \/ __)/ _ \/ __|
| |__| (_) | |   \ V / (_) \__ \  __/ (__
 \____\___/|_|    \_/ \___/(   /\___|\___|
                            |_|
\033[m
"

if [[ "$1" = "-h" ]]; then
	echo -e "\033[37;1m
Options

-s To use the small wordlist
-m To use the medium wordlist
-b To use the bigger wordlist (10000 words)
-t To use Top 500 subdomains by popularity (default)
-a To select your wordlist (If your wordlist is not in the same directory as the script, you will need to write the path to the list)
-h To see this menu
\033[m"
exit 0
fi

# Remember the bigger your worldlist is, bigger the chances of the script find subdomains, but custs more time
case "$2" in
    "")
        for host1 in $(cat top.txt) ; do
            resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)
            if [[ -n $resultdig ]]; then
                echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
            fi
        done
	;;

	"-s")
		for host1 in $(cat small.txt) ; do  # This loop pass the content of a wordlist .txt file to variable host1
		    resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)    # The purpose of this variable its keep the ip results of command dig
			if [[ -n $resultdig ]]; then        # This conditional test will verify the variable resultdig, if the result its null  dont print
				echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
			fi
		done
	;;

	"-m")
		for host1 in $(cat medium.txt) ; do
			resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)
			if [[ -n $resultdig ]]; then
				echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
			fi
		done
	;;

    "-b")
        for host1 in $(cat bigger.txt) ; do
            resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)
            if [[ -n $resultdig ]]; then
                echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
            fi
        done
	;;

    "-t")
        for host1 in $(cat top.txt) ; do
            resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)
            if [[ -n $resultdig ]]; then
                echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
            fi
        done
	;;
	"-a")
        for host1 in $(cat $3) ; do
            resultdig=$(dig +short $host1.$1 | grep -v ";;" | tail -n 1)
            if [[ -n $resultdig ]]; then
                echo -e "\033[37;1mSubdomain find $host1.$1 ===> IP $resultdig\033[m"
            fi
        done
	;;
esac
