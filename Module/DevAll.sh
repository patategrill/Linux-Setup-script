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
            else
                echo "Spotify installation skipped."
            fi
        fi
    fi
    echo "Spotify installation successful"
fi

#chromium
if [[ "$install_chromium" == true ]];
then
    if command -v chromium &> /dev/null;
    then
        echo "Chromium is already install"
    else
        echo "Installing Chromium..."
        sudo $distro install -y chromium &> /dev/null
    fi
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
        tar -xzf vscode.tar.gz -d vscode &> /dev/null
        rm vscode.tar.gz
        cd vscode
        mkdir data

        if [[ "$install_python_extension_for_vscode" == true ]];
        then
            code --install-extension ms-python.python
        fi

        if [[ "$install_c_extension_for_vscode" == true ]];
        then
            code --install-extension ms-vscode.cpptools
        fi

        if [[ "$install_run_extension_for_vscode" == true ]];
        then
            code --install-extension formulahendry.code-runner
        fi
    fi
    echo "Vscode and extension installation successful"
fi

#python3
if [[ "$install_python3" == true ]];
then
    if command -v python3 &> /dev/null;
    then 
        echo "Python is already install"
    else
        echo "Python is missing"
        read -p "Do you want to install it ? [yes or no] : " choice
        if [[ "$choice" == "yes" ]];
        then
        echo "Installing python3..."
            sudo apt install -y python3
        elif [[ "$choice" == "y" ]];
        then 
            echo "Please type yes"
        else
            echo "Installation cancelled"
        fi
    fi
    echo "Python3 installation successful"
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

    echo "NodeJS installation successful"
fi

if [[ "$install_git" == true ]]; then
    
    if command -v git &> /dev/null; then
        echo "Git is already install"
    else
        echo "Installing Git..."
        sudo $distro install -y git
    fi
    echo "Git installation successful"
fi
