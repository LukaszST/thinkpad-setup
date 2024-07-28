#!/bin/bash

function get_release_id() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ -d $PWD/installers/$ID ]; then
            echo $ID
        else
            id_like=$ID_LIKE | cut -d ' ' -f1
            if [ -d $PWD/installers/$id_like ]; then
                echo $id_like
            else
                id_like2=$ID_LIKE | cut -d ' ' -f2
                if [ -d $PWD/installers/$id_like2 ]; then
                    echo $id_like2
                else
                    echo -e $red"not found installers for $ID"
                    exit 0
                fi 
            fi
                    
        fi
    fi
}

distro=$(get_release_id)

function tlp_install() {
    source $PWD/installers/${distro}/tlp.sh
    echo "TLP installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function docker_docs_install() {
    source $PWD/installers/${distro}/docker-docs.sh
    echo "Docker installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function docker_omakub_install() {
    source $PWD/installers/${distro}/docker-omakub.sh
    echo "Docker installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function complete_install() {
    tlp_install
}
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
red='\e[31m'
##
# Color Functions
##
ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
menu() {

echo -ne "
Select option to install
$(ColorGreen '1)') Install tlp and set charge limit
$(ColorGreen '2)') Install Docker using docker-ce
$(ColorGreen '3)') Install Docker using docker.io
$(ColorGreen '5)') Install everything
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) tlp_install ; menu ;;
            2) docker_docs_install ; menu ;;
            3) docker_omakub_install ; menu ;;
	        5) complete_install ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

menu