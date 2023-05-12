Update and Upgrading System

    sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

Requirements file install

    pip install -r requirements.txt
    
Wpscan Installation

    sudo apt install build-essential libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev -y && sudo apt install ruby-full -y && sudo gem install wpscan
   
Assenfinder install

    wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz && tar -xvzf assetfinder-linux-amd64-0.1.1.tgz && chmod +x assetfinder && sudo mv assetfinder /usr/bin/assetfinder && sudo rm -rf assetfinder-linux-amd64-0.1.1.tgz && assetfinder -h
    
Httpx install

    wget https://github.com/projectdiscovery/httpx/releases/download/v1.3.1/httpx_1.3.1_linux_amd64.zip && unzip httpx_1.3.1_linux_amd64.zip && sudo mv httpx /usr/bin/httpx && sudo rm -rf httpx_1.3.1_linux_amd64.zip && httpx -h
    
Others tools

    sudo apt install nmap -y
    
    sudo apt install terminator -y

    sudo apt install vlc -y

    sudo apt install flameshot -y

    sudo apt install gimp -y

    sudo apt install eog -y

    sudo apt install libreoffice -y

    sudo apt install obs-studio -y

    sudo apt install v4l2loopback-dkms -y

    sudo apt install hydra -y

    sudo apt install netcat -y

    sudo apt install net-tools -y

    sudo apt install stacer -y

    sudo apt install filezilla -y

    sudo apt install cherrytree -y

### Gospider Installation
```
wget https://github.com/jaeles-project/gospider/releases/download/v1.1.6/gospider_v1.1.6_linux_x86_64.zip && unzip gospider_v1.1.6_linux_x86_64.zip && cd gospider_v1.1.6_linux_x86_64 && chmod +x gospider && sudo mv gospider /usr/bin/gospider && cd ../ && sudo rm -rf gospider_v1.1.6_linux_x86_64.zip gospider_v1.1.6_linux_x86_64 && gospider -h
```

### SSH Server installation
    sudo apt install openssh-server -y && sudo service ssh restart && sudo apt install net-tools -y && sudo ifconfig

# dvwa installation

    sudo apt install apache2 -y

    sudo apt install mariadb-server mariadb-client php php-mysqli php-gd libapache2-mod-php -y

    sudo service apache2 status

    git clone https://github.com/digininja/DVWA.git

    sudo mv DVWA /var/www/html

    cd /var/www/html

    sudo mv DVWA dvwa

    sudo mv dvwa/config/config.inc.php.dist dvwa/config/config.inc.php

    sudo service mariadb start

    sudo -i

    mysql

    create database dvwa;

    create user dvwa@localhost identified by 'p@ssw0rd';

    grant all on dvwa.* to dvwa@localhost;

    flush privileges;

    sudo id www-data /etc/php/7.4/apache2/

    sudo chown www-data /var/www/html/dvwa/hackable/uploads/

    sudo chmod 777 /var/www/html/dvwa/hackable/uploads/

    sudo chown www-data /var/www/html/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt

    sudo chown www-data /var/www/html/dvwa/config

# downloading wordlists and setup

    sudo mkdir /usr/share/wordlists

    sudo wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz

    tar -xvzf rockyou.txt.gz

    sudo mv rockyou.txt /usr/share/wordlists/

    echo "done"

# burp installation

    cd /opt/ && sudo wget 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2022.12.7&type=Linux' && sudo chmod +x ./burpsuite_community_linux_v2022_12_7.sh && sudo apt install ./burpsuite_community_linux_v2022_12_7.sh -y

    sudo wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/english.txt.gz

    gunzip english.txt.gz

    sudo mv english.txt /usr/share/wordlists/

    echo "done"

    cd /opt/ && sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install ./google-chrome-stable_current_amd64.deb -y && cd

    sudo wget https://github.com/praetorian-inc/Hob0Rules/blob/master/wordlists/shortKrak.txt

    tar -xvzf sqlmap-1.7.tar.gz

    sudo mv firefox /opt/

    sudo wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/109.0.1/linux-x86_64/en-US/firefox-109.0.1.tar.bz2

    wget https://updates.tdesktop.com/tlinux/tsetup.4.6.0.tar.xz

    sudo mv Telegram /opt/

    cd


    cd /opt/ && sudo wget https://download.sublimetext.com/sublime-text_build-4143_amd64.deb && sudo apt install ./sublime-text_build-4143_amd64.deb -y

    cd /usr/share/fonts/ && sudo wget https://www.omicronlab.com/download/fonts/SolaimanLipi_20-04-07.ttf


    git clone https://github.com/danielmiessler/SecLists.git

    git clone https://github.com/sqlmapproject/sqlmap.git

    sudo mv sqlmap /opt/

    sudo chmod +x /opt/sqlmap/sqlmap.py

    sudo ln -s /opt/sqlmap/sqlmap.py /bin/sqlmap

    pip3 install dirsearch
