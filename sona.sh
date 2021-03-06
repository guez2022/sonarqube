#!/bin/bash

#Description: This is the script for sonaqube installation
#Author: Guez DABRE
#Date: 02/28/2022

echo " We are about to start the differents steps for the installation..."
echo
sleep 3
echo " Step 1 :  we are installing JAVA 11... "
echo
sleep 2
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
echo
sleep 2
echo " Step 2 : Now we are downloading sonarqube latest version... "
echo
sleep 2
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
if [ $? -eq 0 ]
then
echo
sleep 2
echo " Step 3 : Extraction of packages... "
else
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo
echo " Step 3 : Extraction of packages... "
fi
echo
sleep 2
sudo unzip /opt/sonarqube-9.3.0.51899.zip
if [ $? -eq 0 ]
then
sleep 2
echo
echo " Step 4 : Changing ownership... "
else
yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo " Step 4 : Changing ownership... "
fi
echo
sleep 2
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
echo
sleep 2
echo " we are connecting to sonaqube... "
echo
sleep 2
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
echo 
sleep 3
echo " installation completed!! thank you for your patience. bye bye "
