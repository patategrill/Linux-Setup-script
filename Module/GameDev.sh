#!/bin/bash
source config/configDev.conf

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

        if [[ "$install_python_extension_for_vscode" == true ]];
        then
            code --install-extension ms-python.python
        fi

        if [[ "$install_run_extension_for_vscode" == true ]];
        then
            code --install-extension formulahendry.code-runner
        fi
    fi
    echo "Vscode and extension installation successful"
fi

if [[ "$install_godot" == true ]];
then
    if command -v godot &> /dev/null;
    then
        echo "Godot is already installed"
    else
        echo "Installing Godot..."
        wget https://github.com/godotengine/godot/releases/download/4.x-stable/Godot_v4.x-stable_linux.x86_64.zip
        unzip Godot_v4.x-stable_linux.x86_64.zip
        sudo mv Godot_v4.x-stable_linux.x86_64 /usr/local/bin/godot
        rm Godot_v4.x-stable_linux.x86_64.zip
    fi
    echo "Godot installation successful"
fi

if [[ "$install_unity_hub" == true ]];
then
    if command -v unity &> /dev/null;
    then
        echo "Unity Hub is already installed"
    else
        echo "Installing Unity Hub..."
        flatpak install flathub com.unity.UnityHub -y &> /dev/null
        echo 'alias unity="flatpak run com.unity.UnityHub"' >> ~/.bashrc
        source ~/.bashrc
    fi
    echo "Unity Hub installation successful"
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
