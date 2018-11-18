#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/supreme

if [[ -f /usr/bin/supreme ]]
then
echo -e "\e[91msupreme is already installed through package manager. You should uninstall through package manager to proceed with this install\e[0m"
else
	if command -v supreme &>/dev/null; then
	echo -e "\e[91msupreme is already installed. Try updating\e[0m"
	else
	instlist=()
	instsrch=$(pwd)
	instdirchk=("$instsrch"/*)
		for check in "${instdirchk[@]}"
		do
			if [[ -d "$check" ]] && [[ "$check" == "supreme-"* ]]
			then
			instlist+=( "$check" )
			fi
		done
		if [[ "${#instlist[@]}" != 0 ]]
		then
			for item in "${instlist[0]}"/*
			do
				case "$item" in
				"${instlist[0]}"/kbfunctions_basic) sudo cp "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/kbfunctions_basic;;
				"${instlist[0]}"/supreme) sudo cp "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/supreme;;
				"${instlist[0]}"/kcm) sudo cp "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/kcm;;
				"${instlist[0]}"/progress_bar) sudo cp "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/progress_bar;;
				esac
			done
		fi
	fi
fi
