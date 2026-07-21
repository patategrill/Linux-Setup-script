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


#Git
if [[ "$install_git" == true ]]; then
    
    if command -v git &> /dev/null; then
        echo "Git is already install"
    else
        echo "Installing Git..."
        sudo $distro install -y git &> /dev/null
    fi
    echo "Git installation successful"
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


#SqlMap
if [[ "$install_sqlmap" == true ]]; then
    if command -v sqlmap &> /dev/null; then
        echo "SqlMap is already install"
    else
        echo "Installing SqlMap..."
        sudo git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap &> /dev/null;
        sudo ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap
        sudo chmod +x /opt/sqlmap/sqlmap.py
    fi
    echo "SqlMap installation successful"
fi


#Nmap
if [[ "$install_nmap" == true ]]; then
    if command -v nmap &> /dev/null; then
        echo "Nmap is already install"
    else
        echo "Installing Nmap..."
        sudo $distro install -y nmap &> /dev/null
    fi
    echo "Nmap installation successful"
fi
