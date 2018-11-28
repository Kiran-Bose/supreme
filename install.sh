#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/supreme

savepath=$(pwd)
#--------------------------------------------------------------------------------------------------
function getos ()
{
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    OS=SUSE
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    OS=Redhat
else
OS="ND"
fi
}

#------------------------------------------------------------------------------------------------
function dependency_check ()
{
deprc=1
depjq=1
depcl=1
if command -v rclone &>/dev/null; then
deprc=0
fi
if command -v jq &>/dev/null; then
depjq=0
fi
if command -v curl &>/dev/null; then
depcl=0
fi
}

#------------------------------------------------------------------------------------------------
function install_binaries ()
{
instlist=()
instsrch=$(pwd)
instdirchk=("$instsrch"/*)
	for check in "${instdirchk[@]}"
	do
	Q=$( echo "$check" | rev | cut -d '/' -f 1 | rev )
		if [[ -d "$check" ]] && [[ "$Q" == "supreme-"* ]]
		then
		instlist+=( "$check" )
		fi
	done
	if [[ "${#instlist[@]}" != 0 ]]
	then
	echo -e "Installing..."
	i=0
		for item in "${instlist[0]}"/*
		do
			case "$item" in
			"${instlist[0]}"/kbfunctions_basic) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/kbfunctions_basic &&
			i=$(($i+1));;
			"${instlist[0]}"/supreme) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/supreme &&
			i=$(($i+1));;
			"${instlist[0]}"/kcm) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/kcm &&
			i=$(($i+1));;
			"${instlist[0]}"/progress_bar) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/progress_bar &&
			i=$(($i+1));;
			esac
		done
		case $i in
		0)echo -e "No files installed";;
		4)echo -e "Successfully installed binaries"
		  getos
		  echo -e "Resolving dependencies..."
		  dependency_check
		  if [[ $deprc == 1 ]] || [[ $depjq == 1 ]] || [[ $depcl == 1 ]]
		  then
			case $OS in
			*buntu*|*Mint*|*Debian*)case $deprc in
						1)sudo apt-get install rclone
						  dependency_check;;
						esac
						case $deprc in
						1)sudo apt install rclone
						  dependency_check;;
						esac
						case $depjq in
						1)sudo apt-get install jq
						  dependency_check;;
						esac
						case $depjq in
						1)sudo apt install jq
						  dependency_check;;
						esac
						case $depcl in
						1)sudo apt-get install curl
						  dependency_check;;
						esac
						case $depcl in
						1)sudo apt install curl
						  dependency_check;;
						esac;;
			*Fedora*)case $deprc in
				 1)sudo dnf install rclone
				   dependency_check;;
				 esac
				 case $deprc in
				 1)sudo yum install rclone
				  dependency_check;;
				 esac
				 case $depjq in
				 1)sudo dnf install jq
				   dependency_check;;
				 esac
				 case $depjq in
				 1)sudo yum install jq
				   dependency_check;;
				 esac
				 case $depcl in
				 1)sudo dnf install curl
				   dependency_check;;
				 esac
				 case $depcl in
				 1)sudo yum install curl
				   dependency_check;;
				 esac;;
			*Red*|*Cent*)case $deprc in
				     1)sudo yum install rclone
				       dependency_check;;
				     esac
				     case $depjq in
				     1)sudo yum install jq
				       dependency_check;;
				     esac
				     case $depcl in
				     1)sudo yum install curl
				       dependency_check;;
				     esac;;
			*SUSE*|*Open*|*SuSE*)case $deprc in
			       	      1)sudo zypper install rclone
			         	dependency_check;;
			              esac
			       	      case $depjq in
			              1)sudo zypper install jq
			         	dependency_check;;
			              esac
			              case $depcl in
			              1)sudo zypper install curl
			         	dependency_check;;
			              esac;;
			*Arch*)case $deprc in
		       	       1)sudo pacman -S rclone
		         	 dependency_check;;
		               esac
		       	       case $depjq in
		               1)sudo pacman -S jq
		         	 dependency_check;;
		               esac
		               case $depcl in
		               1)sudo pacman -S curl
		         	 dependency_check;;
		               esac;;
			esac
			case $deprc in
			0)echo -e "Dependency 'rclone':resolved";;
			1)echo -e "Failed to install rclone. Try manual install";;
			esac
			case $depjq in
			0)echo -e "Dependency 'jq':resolved";;
			1)echo -e "Failed to install jq. Try manual install";;
			esac
			case $depcl in
			0)echo -e "Dependency 'curl':resolved";;
			1)echo -e "Failed to install curl. Try manual install";;
			esac
		  else
		  echo "Dependencies resolved"
		  fi;;
		  
		*)echo -e "Unknown error during installation";;
		esac
	else
	echo -e "No installables found"
	fi

}

#------------------------------------------------------------------------------------------------
checkInternet()
{
  ping -c2 github.com > /dev/null 2>&1 || { echo -e "Error: no active internet connection" >&2; return 1; }
}

#------------------------------------------------------------------------------------------------
if [[ -f /usr/bin/supreme ]]
then
echo -e "supreme is already installed through package manager. You should uninstall through package manager to proceed with this install"
else
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
