#!/bin/bash
echo -e "\e[36mChoose Debian Version(10/11): \e[0m"
ver=""
read vers #Read Debian version

#Recreate sources.list
filePath="/etc/apt/sources.list"
if [ ! -f "$filePath" ]
then
    sudo touch $filePath
    echo -e "\e[32mCreated file \e[0m"
else
    sudo rm /etc/apt/sources.list
    sudo touch $filePath
    echo -e "\e[32mFile exists, removed and created \e[0m"
fi
sudo chmod 777 /etc/apt/sources.list

#Write new sources
if [ $vers -eq 11 ]
then
    echo "---------------------------------"
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
    sudo cat /etc/apt/sources.list
    echo -e "\e[32mDebian11 Written \e[0m"
    echo "---------------------------------"
elif [ $vers -eq 10 ]
then
    echo "---------------------------------"
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free ' >> /etc/apt/sources.list
    sudo echo 'deb-src https://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free' >> /etc/apt/sources.list
    sudo cat /etc/apt/sources.list
    echo -e "\e[32mDebian10 Written \e[0m"
    echo "---------------------------------"
else
    echo -e "\e[31mVersion error! \e[0m"
    exit
fi

echo -e "\e[36mInstall required environment \e[0m"
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
echo -e "\e[32mInstalled \e[0m"
echo "---------------------------------"

echo -e "\e[36mInstall GPG Key \e[0m"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo -e "\e[32mInstalled \e[0m"
echo "---------------------------------"

echo -e "\e[36mSetup sources \e[0m"
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.ustc.edu.cn/docker-ce/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo -e "\e[32mSuccess \e[0m"
echo "---------------------------------"

echo -e "\e[36mInstall Docker Engine \e[0m"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo -e "\e[32mInstalled \e[0m"
echo "---------------------------------"

echo -e "\e[36mFinished install, run test \e[0m"
sudo docker run hello-world