#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/supreme

if command -v supreme &>/dev/null; then
	echo -e "Are you sure you want to uninstall supreme? (y/n)"
	read remopt
	case "$remopt" in
	y|Y)if [[ -f /usr/local/bin/supreme ]]
	    then
	    sudo rm -vf /usr/local/bin/supreme  
	    fi
	    if [[ -f /usr/local/bin/kcm ]]
	    then
	    sudo rm -vf /usr/local/bin/kcm  
	    fi
	    if [[ -f /usr/local/bin/kbfunctions_basic ]]
	    then
	    sudo rm -vf /usr/local/bin/kbfunctions_basic   
	    fi
	    if [[ -f /usr/local/bin/progress_bar ]]
	    then
	    sudo rm -vf /usr/local/bin/progress_bar  
	    fi
	    echo
	    echo -e "Following dependencies have to be removed manually through package manager\n(1)rclone\n(2)jq\n(3)curl [Available by default in most of the linux distros]"
	    echo;;
	*)echo -e "You opted out from uninstalling supreme";;
	esac
else
echo "supreme not installed: Hence not removed"
fi
    
