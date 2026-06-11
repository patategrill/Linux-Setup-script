#!/bin/bash

source ../Config/configDev.conf

#Spotify
if [[ "$install_spotify" == true ]];
then
    if command -v spotify &> /dev/null;
    then
        echo "Spotify is already install"
    else
        echo "Installing Spotify..."
        if command -v flatpak &> /dev/null;
        then
            flatpak install -y flathub com.spotify.Client &> /dev/null
        else
            echo "Flatpak is not installed. Do you want to install it ? (y/n)"
            read -r answer
            if [[ "$answer" == "y" ]]; then
                sudo $distro install -y flatpak &> /dev/null
                flatpak install -y flathub com.spotify.Client &> /dev/null
                sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &> /dev/null
                echo 'alias spotify="flatpak run com.spotify.Client"' >> ~/.bashrc
                source ~/.bashrc
            else
                echo "Spotify installation skipped."
            fi
        fi
    fi
    echo "Spotify installation successful"
fi

#vscode
if [[ "$install_code" == true ]];
then
    if command -v code &> /dev/null;
    then
        echo "Vscode is already install"
    else
        echo "Installing Vscode..."
        wget -O vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable &> /dev/null;
        tar -xzf vscode.tar.gz &> /dev/null
        rm vscode.tar.gz
        cd vscode
        mkdir data

        if [[ "$install_run_extension_for_vscode" == true ]];
        then
            code --install-extension formulahendry.code-runner
        fi
    fi
    echo "Vscode and extension installation successful"
fi

#NodeJS
if [[ "$install_nodejs" == true ]];
then

    if command -v node &> /dev/null;
    then
        echo "NodeJS is already install"
    else
        echo "NodeJS is missing"
        read -p "Do you want to install it ? [yes or no] :" choice
        if [[ "$choice" == "yes" ]];
        then
        echo "Installing NodeJS..."
            sudo apt install -y node
        elif [[ "$choice" == "y" ]];
        then 
            echo "Please type yes"
        else
            echo "Installation cancelled"
        fi
    fi

if [[ "install_docker" == true ]];
then
    if command -v docker &> /dev/null;
    then
        echo "Docker is already install"
    else
        echo "Installing Docker..."
    fi
fi
