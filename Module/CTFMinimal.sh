#!/bin/bash
source config/configCTF.conf

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

#Ghidra
if [[ "$install_ghidra" == true ]];
then 
    if command -v ghidra &> /dev/null;
    then
        echo "Ghidra is already install"
    else
        echo "Installing Ghidra..."
        wget -O ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/latest/download/ghidra.zip &> /dev/null;
        unzip ghidra.zip -d ghidra
        rm ghidra.zip
        sudo $distro install default-jdk &> /dev/null;
        echo "./ghidra/ghidraRun" > run-ghidra.sh
    fi
fi


#Wordlist(rockyou)
if [[ "$install_wordlist" == true ]];
then
    echo "Installing wordlist (rockyou)..."
    git clone https://github.com/RykerWilder/rockyou.txt.git &> /dev/null
fi

#Wireshark
if [[ "$install_wireshark" == true ]];
then
    if command -v wireshark &> /dev/null;
    then
        echo "Wireshark is already install"
    else
        echo "Installing Wireshark..."
        sudo $distro install -y wireshark &> /dev/null
    fi
    echo "Wireshark installation successful"
fi
