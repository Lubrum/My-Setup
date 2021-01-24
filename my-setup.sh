#!/bin/sh
sudo -i;
cd $HOME;
sudo apt-get update;

echo 'Installing wget and ca-certificates'
sudo apt-get install wget ca-certificates -y;

################ Version Control ################
echo 'Installing Git';
sudo apt-get install git -y;

echo "Provide Git user.name";
read git_user_name;
git config --global user.name "$git_user_name";

echo "Provide Git user.email";
read git_user_email;
git config --global user.email "$git_user_email";

################ For R development ################
echo 'installing R 4.0 (Ubuntu 18.04.4 LTS - Bionic Beaver)';
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/';
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9;
sudo apt update;
sudo apt install r-base r-base-core r-recommended r-base-dev -y;

echo 'Installing libgdal-dev (R)';
sudo apt install libgdal-dev -y;
echo 'Installing libnss3 (R)'; 
sudo apt-get install libnss3 -y;
echo 'Installing cargo (R)';
sudo apt-get install cargo -y;
echo 'Installing libavfilter-dev (R)';
sudo apt-get install libavfilter-dev -y;
echo 'Installing libudunits2-dev (R)';
sudo apt-get install libudunits2-dev -y;
sudo add-apt-repository -y ppa:cran/poppler;
sudo apt-get update;
echo 'Installing libpoppler-cpp-dev (R)';
sudo apt-get install libpoppler-cpp-dev -y;
sudo add-apt-repository -r ppa:'cran/poppler'
echo 'Installing libsdl2-2.0-0 (R)';
sudo apt-get install libsdl2-2.0-0 -y;

sudo apt --fix-broken install -y;
echo 'Installing libclang-dev (RStudio)';
sudo apt-get install libclang-dev -y;

echo 'Download RStudio 1.3.959 (2020-09-20)';
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb;
sudo dpkg -i $HOME/rstudio-1.3.1093-amd64.deb;

################ Private network tools ################
echo 'Installing openvpn (Ubuntu 18.04.4 LTS - Bionic Beaver)';
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -;
echo "deb http://build.openvpn.net/debian/openvpn/stable bionic main" > /etc/apt/sources.list.d/openvpn-aptrepo.list;

################ For Java development ################
echo 'Installing java 11 jdk'; 
sudo apt install default-jdk -y;

echo 'Installing java 8 jdk'; 
sudo apt install openjdk-8-jdk;

#sudo update-alternatives --config java;
sudo update-java-alternatives --jre-headless --set java-1.11.0-openjdk-amd64;

################ ssh ################
echo 'Installing openssh-server'; 
sudo apt install openssh-server -y;

# only works after installing git
echo 'Generating ssh key'; 
ssh-keygen -t rsa -b 4096 -C $git_user_email; 
ssh-add ~/.ssh/id_rsa; 
cat ~/.ssh/id_rsa.pub;

################ For dependency management ################
echo 'Installing maven';
sudo apt install maven -y;

echo 'Installing google chrome';
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
sudo dpkg -i google-chrome-stable_current_amd64.deb;

################ postgresql and pgadmin4 (database) ################
echo 'Installing postgresql-11'; 
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -;
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/lsb_release -cs-pgdg main" >> /etc/apt/sources.list.d/pgdg.list';
sudo apt update;
sudo apt -y install postgresql-11;

echo 'Installing pgadmin4 pgadmin4-apache2'; 
sudo apt install pgadmin4 pgadmin4-apache2 -y;

################ Jekyll Dependencies (Ruby) ################
echo 'Installing Ruby';
sudo apt-get update;
sudo apt-get install ruby -y;

echo 'Installing ruby-dev'; 
sudo apt-get install ruby-dev -y;
sudo gem install bundler;
sudo gem install jekyll;

################ Automated mail tools ################
echo 'Installing mailutils';
sudo apt install mailutils -y;

# hibernation on Ubuntu 18.04.4
#grep swap /etc/fstab
#sudo nano /etc/default/grub
#sudo nano /etc/initramfs-tools/conf.d/resume
#sudo nano /etc/default/grub
#echo "RESUME=UUID=5c61874e-d6ea-460d-a8fc-4cf551489e6b" | sudo tee /etc/initramfs-tools/conf.d/resume
#sudo update-initramfs -u -k all
#sudo update-grub
#sudo systemctl hibernate

echo 'Installing net-tools for ifconfig and net tools D:';
sudo apt install net-tools -y;

# If OS does not have Snap... 
#sudo apt update
#sudo apt install snapd -y

# only works if system has Snap (Snap is already installed in Ubuntu 16.04+ versions)
################ IDE for development (Java in my case) ################
echo 'Installing Eclipse (snap)';
sudo snap install --classic eclipse;

################ API tests ################
echo 'Installing Postman (snap)';
sudo snap install postman;

################ IDE for mobile development (Java and Kotlin in my case) ################
echo 'Installing Android Studio (snap)';
sudo snap install android-studio --classic;

################ General purpose tools ################
echo 'Installing kazam (screen recorder)'; 
sudo apt-get install kazam -y;

echo 'Installing Shotcut (snap) (video editor)';
sudo snap install shotcut --classic;

echo 'Installing ShotWell (snap) (image editor)';
sudo snap install shotwell-adam --edge;
#error: The publisher of snap "shotwell-adam" has indicated that they do not
#       consider this revision to be of production quality and that it is only
#       meant for development or testing at this point. As a consequence this
#       snap will not refresh automatically and may perform arbitrary system
#       changes outside of the security sandbox snaps are generally confined to,
#       which may put your system at risk.

#       If you understand and want to proceed repeat the command including
#       --devmode; if instead you want to install the snap forcing it into
#       strict confinement repeat the command including --jailmode.

echo 'Installing kolourpaint (an alternative for known paint from Windows';
sudo apt install kolourpaint;

echo 'Installing Intellij-idea-community (snap)';
sudo snap install intellij-idea-community --classic;

echo 'Installing Nodejs';
sudo apt-get install nodejs

echo 'Installing nethogs (for inspecting live tcp and udp connections)';
sudo apt-get install nethogs

echo 'Installing rvm (ruby version manager)';
sudo apt-get install rvm

echo 'Installing Heroku';
sudo snap install --classic heroku

echo 'Installing useful libraries for frontend development (react-router-dom, react-dom, axios, react-leaflet, react-select, react-toastify)'
npm install react-router-dom
npm install @types/react-router-dom
npm install axios
npm install react react-dom leaflet
npm install react-leaflet
npm install -D @types/leaflet
npm install react-select @types/react-select
npm install --save react-toastify

echo 'Installing useful libraries for mobile development with react native (expo-cli, react-native libraries, dayjs, intl)'
npm install --global expo-cli
expo install @react-navigation/stack @react-native-community/masked-view react-native-screens react-native-gesture-handler @react-navigation/native expo-app-loading @expo-google-fonts/open-sans expo-font
npm install dayjs --save
npm install Intl
npm install intl

echo 'Installing Avocado, useful library for reducing .xml path size (generally used in mobile resources)'
npm install -g avocado