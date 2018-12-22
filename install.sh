#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/supreme

savepath=$(pwd)
#------------------------------------------------------------------------------------------------
if [[ -f /usr/bin/supreme ]]
then
echo -e "supreme is already installed through package manager. You should uninstall through package manager to proceed with this install"
else
. install_feed
	if command -v supreme &>/dev/null; then
	echo -e "supreme is already installed. Do you want to check for updates?(y/n)"
	read upch
		case $upch in
		y|Y)checkInternet || return 1
			    if [[ -f /usr/local/bin/kbfunctions_basic ]]; then
			    . /usr/local/bin/kbfunctions_basic
			    else
			    echo 'Update Failed'
			    return 1
			    fi
		    upstreamversion=$(curl -A curl -s https://api.github.com/repos/kiran-bose/supreme/tags | grep -Eo '"name":.*?[^\\]",'| head -1 | grep -Eo "[0-9.]+" )
		    if [[ $upstreamversion == "" ]]; then
    		    echo "Error: no active internet connection" >&2
    		    return 1
  		    else
	    		    if [[ "$upstreamversion" != "$currentversion" ]]; then
	      		    echo "Version $upstreamversion available"
			    echo -e "Do you wish to update? (y/n)"
			    read upans
				case $upans in
				y|Y)cd ~ || { echo 'Update Failed'; return 1; }
		    		    if [[ -d supreme ]]
		    		    then
		    	            sudo rm -rf supreme
		    		    fi
		    		    git clone https://github.com/kiran-bose/supreme && echo "Done"
				    cd supreme || { echo 'Update Failed'; return 1; }
				    . install_feed
				    install_binaries
					    if [[ -d "$savepath" ]]; then
					    cd
					    cd "$savepath"
					    fi;;
				esac
			    else
			    echo -e "No updates available for supreme"
			    fi
		     fi;;
		esac
	else
	install_binaries
	fi
fi
