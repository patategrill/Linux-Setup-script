#!/bin/bash
source config/configOfficeSoftware.conf

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

#libreOffice
if [[ "$install_LibreOffice" == true ]]; then
    if command -v libreoffice &> /dev/null; then
        echo "libreOffice is already install"
    else
        echo "Installing LibreOffice..."
        sudo $distro install -y libreoffice
    fi
    echo "LibreOffice installation successful"
fi

if [[ "$install_okular" == true ]]; then
    if command -v okular &>/dev/null; then
        echo "Okular is already install"
    else
        echo "Installing Okular..."
        sudo $distro install -y okular
    fi
    echo "Okular installation successful"
fi
