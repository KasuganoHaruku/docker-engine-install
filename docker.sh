#!/bin/bash
echo -e "\e[32mChoose Debian Version(10/11/12): \e[0m"
vers=""
mirr=""
read vers #Select Debian version

if [ $vers -eq 11 ] || [ $vers -eq 12 ]
then
    echo -e "\e[32mChoose Mirror: \e[0m"
    echo -e "\e[36m1.USTC \e[0m"
    echo -e "\e[36m2.Tsinghua Tuna \e[0m"
    echo -e "\e[36m3.Aliyun \e[0m"
    echo -e "\e[36m4.Neteast 163 \e[0m"
    read mirr #Select mirror
elif [ $vers -eq 10 ]
then
    mirr="1"
fi

#mirrors
ustc="https://mirrors.ustc.edu.cn/debian/"
ustc_s="https://mirrors.ustc.edu.cn/debian-security/"
ustc_d="https://mirrors.ustc.edu.cn/docker-ce/linux/debian"
tuna="https://mirrors.tuna.tsinghua.edu.cn/debian/"
tuna_s="https://mirrors.tuna.tsinghua.edu.cn/debian-security/"
tuna_d="https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian"
ali="https://mirrors.aliyun.com/debian/"
ali_s="https://mirrors.aliyun.com/debian-security/"
ali_d="http://mirrors.aliyun.com/docker-ce/linux/debian"
nete="http://mirrors.163.com/debian/"
nete_s="http://mirrors.163.com/debian-security/"
nete_d="https://mirrors.163.com/docker-ce/linux/debian"

if [ $mirr -eq 1 ]
then
    url=$ustc
    url_s=$ustc_s
    url_d=$ustc_d
    name="USTC"
elif [ $mirr -eq 2 ]
then
    url=$tuna
    url_s=$tuna_s
    url_d=$tuna_d
    name="Tuna"
elif [ $mirr -eq 3 ]
then
    url=$ali
    url_s=$ali_s
    url_d=$ali_d
    name="Aliyun"
elif [ $mirr -eq 4 ]
then
    url=$nete
    url_s=$nete_s
    url_d=$nete_d
    name="Neteast"
fi

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
if [ $vers -eq 12 ]
then
    echo "---------------------------------"
    sudo echo 'deb '$url' bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bookworm main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb '$url' bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb '$url' bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb '$url_s' bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url_s' bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list
    sudo cat /etc/apt/sources.list
    echo -e "\e[32mDebian12 $name Written \e[0m"
    echo "---------------------------------"
elif [ $vers -eq 11 ]
then
    echo "---------------------------------"
    sudo echo 'deb '$url' bullseye main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bullseye main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb '$url' bullseye-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bullseye-updates main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb '$url' bullseye-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url' bullseye-backports main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb '$url_s' bullseye-security main contrib non-free' >> /etc/apt/sources.list
    sudo echo 'deb-src '$url_s' bullseye-security main contrib non-free' >> /etc/apt/sources.list
    sudo cat /etc/apt/sources.list
    echo -e "\e[32mDebian11 $name Written \e[0m"
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



echo -e "\e[36mSetup sources \e[0m"
echo -e "\e[36mInstall GPG Key \e[0m"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL $url_d/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo -e "\e[32mInstalled \e[0m"
echo "---------------------------------"
echo \
"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] $url_d \
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
