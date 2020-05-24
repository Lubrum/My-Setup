#!/bin/sh
sudo apt-get update

echo 'Installing  git' 
sudo apt-get install git -y

echo "Provide Git user.name"
read git_user_name
git config --global user.name "$git_user_name"

echo "Provide Git user.email"
read git_user_email
git config --global user.email "$git_user_email"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update

echo 'Installing  R-base, gdebi-core, build-essential' 
sudo apt install r-base -y
sudo apt install gdebi-core -y
sudo apt install make build-essential -y

echo 'Installing  openvpn (18.04.4 LTS)' 
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
echo "deb http://build.openvpn.net/debian/openvpn/stable bionic main" > /etc/apt/sources.list.d/openvpn-aptrepo.list

echo 'Installing  java 11 jdk' 
sudo apt install default-jdk -y

echo 'Installing  libgdal-dev (R)' 
sudo apt install libgdal-dev -y

echo 'Installing  openssh-server' 
sudo apt install openssh-server -y

sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update

echo 'Installing  java 11 jre' 
sudo apt install openjdk-11-jre-headless -y
sudo apt autoremove

echo 'Installing google chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'Installing  libnss3 (R)' 
sudo apt-get install --reinstall libnss3 -y

echo 'Installing postgresql postgresql-contrib' 
sudo apt install postgresql postgresql-contrib -y
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

echo 'Installing pgadmin4 pgadmin4-apache2' 
sudo apt install pgadmin4 pgadmin4-apache2 -y

sudo apt update && sudo apt -y upgrade
echo 'Installing postgresql-11' 
sudo apt -y install postgresql-11
sudo -u postgres psql

echo 'Installing  cargo (R)' 
sudo apt-get install cargo -y
echo 'Installing  libavfilter-dev (R)' 
sudo apt-get install libavfilter-dev -y
echo 'Installing  libudunits2-dev (R)' 
sudo apt-get install libudunits2-dev -y
sudo add-apt-repository -y ppa:cran/poppler
sudo apt-get update
echo 'Installing libpoppler-cpp-dev (R)' 
sudo apt-get install libpoppler-cpp-dev -y
echo 'Installing libsdl2-2.0-0 (R)' 
sudo apt-get install libsdl2-2.0-0 -y

echo 'Installing Ruby' 
sudo apt-get update
sudo apt-get install ruby -y
sudo apt autoremove

echo 'Installing ruby-dev' 
sudo apt-get install ruby-dev -y
sudo gem install bundler
sudo gem install jekyll
sudo bundle update
sudo bundle install

echo 'Installing mailutils' 
sudo apt install mailutils -y

echo 'Installing kazam' 
sudo apt-get install kazam -y
sudo apt-get upgrade kazam -y

echo 'Installing java 8 jdk' 
sudo apt install openjdk-8-jdk
sudo update-alternatives --config java

# ajustes para viabilizar hibernação no Ubuntu 18.04.4
#grep swap /etc/fstab
#sudo nano /etc/default/grub
#sudo nano /etc/initramfs-tools/conf.d/resume
#sudo nano /etc/default/grub
#echo "RESUME=UUID=5c61874e-d6ea-460d-a8fc-4cf551489e6b" | sudo tee /etc/initramfs-tools/conf.d/resume
#sudo update-initramfs -u -k all
#sudo update-grub
#sudo systemctl hibernate

# only works after installing git
echo 'Generating ssh key'
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

# Pendente: RStudio, Eclipse, Android Studio, Postman, Shotcut, Shotwell, KolourPaint
