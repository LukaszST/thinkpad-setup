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

function lazy_docker_install() {
    source $PWD/installers/${distro}/lazy-docker.sh
    echo "Lazy-docker installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function neovim_install() {
    source $PWD/installers/${distro}/neovim.sh
    echo "Neovim installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function lazygit_install() {
    source $PWD/installers/${distro}/lazygit.sh
    echo "Lazygit installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function fastfetch_install() {
    source $PWD/installers/${distro}/fastfetch.sh
    echo "Fastfetch installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function zellij_install() {
    source $PWD/installers/${distro}/zellij.sh
    echo "Zellij installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function github_cli_install() {
    source $PWD/installers/${distro}/github-cli.sh
    echo "Github Cli installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function zsh_install() {
    source $PWD/installers/${distro}/zsh.sh
    echo "Github Cli installed"
#    For now I will use sleep to not showing menu after message from installer
    sleep 2
}

function complete_install() {
    tlp_install
    echo -ne "
    Select option to install
    $(ColorGreen '2)') Install Docker using docker-ce
    $(ColorGreen '3)') Install Docker using docker.io
    $(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option:') "
    read a
        case $a in
            2) docker_docs_install ;;
            3) docker_omakub_install ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac

    lazy_docker_install
    neovim_install
    lazygit_install
    fastfetch_install


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
$(ColorGreen '4)') Install Lazy-docker using docker.io
$(ColorGreen '5)') Install neovim with lazyvim setup
$(ColorGreen '6)') Install lazygit
$(ColorGreen '7)') Install fastfetch
$(ColorGreen '8)') Install zellij
$(ColorGreen '9)') Install Github cli
$(ColorGreen '10)') Install Zsh with OhMyZsh
$(ColorGreen '69)') Install everything
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) tlp_install ; menu ;;
            2) docker_docs_install ; menu ;;
            3) docker_omakub_install ; menu ;;
            4) lazy_docker_install ; menu ;;
            5) neovim_install ; menu ;;
            6) lazygit_install ; menu ;;
            7) fastfetch_install ; menu ;;
            8) zellij_install ; menu ;;
            9) github_cli_install ; menu ;;
            10) zsh_install ; menu ;;
	        69) complete_install ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

menu