## EIL(Easy Installation script for Linux) to automate the installation of multiple programs

### Dev script :  
- Spotify 
- Chromium 
- Git 
- Vscode (and extension)
- Python3 
- NodeJS

### CTF script :  
- Spotify
- Chromium
- Ghidra
- Wordlist
- Wireshark
- SqlMap 
- Nmap

### Office Software script :  
- Spotify
- Chromium
- LibreOffice 
- Obsidian
- Okular (like Adobe acrobat)

### This tool is available on :  
Debian  
Ubuntu (and other variant)  
Kali Linux  
Parrot OS  
Mint  
Pop!_OS  
Fedora  
RHET  
Rocky Linux  
OpenSuse

This program require an internet connection  
#### You must update your systeme before installation with the command :  
On Debian, Ubuntu, Mint, Pop!_OS :

    sudo apt update


On Fedora : 

    sudo dnf upgrade -y

### You must give to setup.sh the rights of execution in terminal with :

    chmod +x setup.sh

It can be launched in terminal with :

    ./setup.sh

You can use this tool to automate installation for various programs according on the category you choose  

You have 2 mode by configuration : Minimal and All, Minimal config provide you with the minimum necessary equipment to work in good conditions and the All config install all the tools you need to work in good conditions

You can modify the programs to be installed according to your preferences in the .conf files without modifying the code.
In the `.conf` file you must respect this syntax : `variable=`  
It's essential that the characters are joined together.
