#!/bin/bash
echo -e "\e[32mChoose Debian Version(10/11): \e[0m"
vers=""
mirr=""
read vers #Select Debian version

if [ $vers -eq 11 ]
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
    if [ $mirr -eq 1 ]
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
        echo -e "\e[32mDebian11 USTC Written \e[0m"
        echo "---------------------------------"
    elif [ $mirr -eq 2 ]
    then
        echo "---------------------------------"
        sudo echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo cat /etc/apt/sources.list
        echo -e "\e[32mDebian11 Tsinghua Tuna Written \e[0m"
        echo "---------------------------------"
    elif [ $mirr -eq 3 ]
    then
        echo "---------------------------------"
        sudo echo 'deb https://mirrors.aliyun.com/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.aliyun.com/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo cat /etc/apt/sources.list
        echo -e "\e[32mDebian11 Aliyun Written \e[0m"
        echo "---------------------------------"
    elif [ $mirr -eq 4 ]
    then
        echo "---------------------------------"
        sudo echo 'deb http://mirrors.163.com/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src http://mirrors.163.com/debian/ bullseye main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb http://mirrors.163.com/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src http://mirrors.163.com/debian/ bullseye-updates main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb http://mirrors.163.com/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src http://mirrors.163.com/debian/ bullseye-backports main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb http://mirrors.163.com/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo echo 'deb-src http://mirrors.163.com/debian-security/ bullseye-security main contrib non-free' >> /etc/apt/sources.list
        sudo cat /etc/apt/sources.list
        echo -e "\e[32mDebian11 Neteast 163 Written \e[0m"
        echo "---------------------------------"
    else
        echo -e "\e[31mSource error! \e[0m"
        exit
    fi
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
if [ $mirr -eq 1 ]
then
    echo -e "\e[36mInstall GPG Key \e[0m"
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo -e "\e[32mInstalled \e[0m"
    echo "---------------------------------"
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.ustc.edu.cn/docker-ce/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
elif [ $mirr -eq 2 ]
then
    echo -e "\e[36mInstall GPG Key \e[0m"
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo -e "\e[32mInstalled \e[0m"
    echo "---------------------------------"
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
elif [ $mirr -eq 3 ]
then
    echo -e "\e[36mInstall GPG Key \e[0m"
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo -e "\e[32mInstalled \e[0m"
    echo "---------------------------------"
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] http://mirrors.aliyun.com/docker-ce/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
elif [ $mirr -eq 4 ]
then
    echo -e "\e[36mInstall GPG Key \e[0m"
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://mirrors.163.com/docker-ce/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo -e "\e[32mInstalled \e[0m"
    echo "---------------------------------"
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.163.com/docker-ce/linux/debian/ \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
    echo -e "\e[31mSource error! \e[0m"
    exit
fi


echo -e "\e[32mSuccess \e[0m"
echo "---------------------------------"

echo -e "\e[36mInstall Docker Engine \e[0m"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo -e "\e[32mInstalled \e[0m"
echo "---------------------------------"

echo -e "\e[36mFinished install, run test \e[0m"
sudo docker run hello-world
