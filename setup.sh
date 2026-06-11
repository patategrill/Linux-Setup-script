#!/bin/bash


if command -v apt &> /dev/null;
then
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configDev.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configCTF.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configOfficeSoftware.conf

elif command -v dnf &> /dev/null;
then
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configDev.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configCTF.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configOfficeSoftware.conf

elif command -v pacman &> /dev/null;
then
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configDev.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configCTF.conf
    sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configOfficeSoftware.conf

else
    echo "Unsupported Linux distribution. Please install packages manually."
    exit
fi


echo "Choose option :"
echo "1) Dev"
echo "2) CTF"
echo "3) Office Software"
read choice1

if [[ "$choice1" == "1" ]];
then 
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    echo "3) Web Dev"
    echo "4) Game Dev"
    read choice2
    if [[ "$choice2" == "1" ]];
    then
        echo "Installing Minimal Dev configuration..."
        source Module/DevMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then

        echo "Installing All Dev configuration..."
        source Module/DevAll.sh
    elif [[ "$choice2" == "3" ]];
    then
        echo "Installing Web Dev configuration..."
        source Module/DevWeb.sh
    elif [[ "$choice2" == "4" ]];
    then
        echo "Installing Game Dev configuration..."
        source Module/DevGame.sh
    else
        echo "Invalid input"
    fi
elif [[ "$choice1" == "2" ]];
then
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    read choice2  
    if [[ "$choice2" = "1" ]];
    then  
        echo "Installing Minimal CTF configuration..."
        source Module/CTFMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then
        echo "Installing All CTF configuration..."
        source Module/CTFAll.sh
    else
        echo "Invalid input"
    fi
elif [[ "$choice1" == "3" ]];
then
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    read choice2
    if [[ "$choice2" == "1" ]];
    then
        echo "Installing Minimal Office Software configuration..."
        source Module/OfficeSoftwareMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then
        echo "Installing All Office Software configuration..."
        source Module/OfficeSoftwareAll.sh
    else
        echo "Invalid input"
    fi
else
    echo "Invalid input"
fi
