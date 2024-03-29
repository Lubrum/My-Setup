#!/bin/sh

cd $HOME;
sudo apt-get update;

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing wget and ca-certificates' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install wget ca-certificates &&

################ Version Control ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Git' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install git -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo "Provide Git user.name" &&
echo '                                              ' &&
echo '----------------------------------------------' &&
read git_user_name &&
git config --global user.name "$git_user_name" &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo "Provide Git user.email" &&
echo '                                              ' &&
echo '----------------------------------------------' &&
read git_user_email &&
git config --global user.email "$git_user_email" &&

################ For R development ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'installing R 4.0 (any ubuntu version)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&

# update indices
sudo apt update -qq &&
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr &&
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
sudo wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc &&
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" &&
sudo apt install --no-install-recommends r-base -y &&
#sudo apt install r-base r-base-core r-recommended r-base-dev -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libgdal-dev (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt install libgdal-dev -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libnss3 (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libnss3 -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing cargo (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install cargo -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libavfilter-dev (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libavfilter-dev -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libudunits2-dev (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libudunits2-dev -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libpoppler-cpp-dev (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libpoppler-cpp-dev -y &&
sudo add-apt-repository -r ppa:'cran/poppler' &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libsdl2-2.0-0 (R)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libsdl2-2.0-0 -y &&
sudo apt --fix-broken install -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing libclang-dev (RStudio)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install libclang-dev -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Download RStudio 1.3.959 (2020-09-20)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2021.09.2-382-amd64.deb &&
sudo dpkg -i $HOME/rstudio-2021.09.2-382-amd64.deb &&

################ Private network tools ################

################ For Java development ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing java 11 jdk' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install openjdk-11-jdk &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing java 8 jdk' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install openjdk-8-jdk &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing java 17 jdk' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install openjdk-17-jdk

################ ssh ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing openssh-server' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install openssh-server &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Generating ssh key' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
# only works after installing git
ssh-keygen -t rsa -b 4096 -C $git_user_email &&
ssh-add ~/.ssh/id_rsa &&
cat ~/.ssh/id_rsa.pub &&

################ For dependency management ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing maven' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install maven &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing google chrome';
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&

################ postgresql and pgadmin4 (database) ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing postgresql-11' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt install postgresql postgresql-contrib -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing curl' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt install curl -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing pgadmin4 pgadmin4-apache2' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add &&
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/focal/ pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update' &&
sudo apt install pgadmin4 -y &&

################ Jekyll Dependencies (Ruby) ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Ruby' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get update &&
sudo apt-get install ruby -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing ruby-dev' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install ruby-dev -y &&
sudo gem install bundler &&
sudo gem install jekyll &&

################ Automated mail tools ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing mailutils' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt install mailutils -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing net-tools for ifconfig and net tools D:' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt install net-tools -y &&

# If OS does not have Snap... 
#sudo apt update
#sudo apt install snapd -y

# only works if system has Snap (Snap is already installed in Ubuntu 16.04+ versions)
################ IDE for development (Java in my case) ################

#echo '----------------------------------------------' &&
#echo '                                              ' &&
#echo 'Installing Eclipse (snap)' &&
#echo '                                              ' &&
#echo '----------------------------------------------' &&
#sudo snap install --classic eclipse &&

################ API tests ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Postman (snap)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo snap install postman &&

################ IDE for mobile development (Java and Kotlin in my case) ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Android Studio (snap)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo snap install android-studio --classic &&

################ General purpose tools ################
echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing kazam (screen recorder)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get install kazam -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Shotcut (snap) (video editor)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo snap install shotcut --classic &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Intellij-idea-community (snap)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo snap install intellij-idea-community --classic &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Nodejs' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install nodejs &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing npm' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install npm &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing nethogs (for inspecting live tcp and udp connections)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt-get -y install nethogs &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing useful libraries for mobile development with react native (expo-cli)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo npm install --global expo-cli -y &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Avocado, useful library for reducing .xml path size (generally used in mobile resources)' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
npm install -g avocado &&

echo '----------------------------------------------' &&
echo '                                              ' &&
echo 'Installing Visual Studio Code' &&
echo '                                              ' &&
echo '----------------------------------------------' &&
sudo apt update &&
sudo apt install software-properties-common apt-transport-https wget &&
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
sudo apt install code -y
