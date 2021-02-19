#!/usr/bin/env bash

cd
echo "-----> Install gclone"
wget https://dl.dropboxusercontent.com/s/py5datuvmrhj3a8/gclone
mv gclone /usr/bin/
chmod +x /usr/bin/gclone
echo "-----> Gclone Installed"

echo "-----> Install fclone"
wget https://dl.dropboxusercontent.com/s/sll2ikdhmkcj69q/fclone
mv gclone /usr/bin/
chmod +x /usr/bin/fclone
echo "-----> Gclone Installed"

echo "-----> Download SA"
wget https://dl.dropboxusercontent.com/s/isz91dykvi02s0n/accounts.zip
unzip -o accounts.zip
rm accounts.zip
echo "-----> SA Downloaded"

echo "-----> Download Gclone Config"
cd ~
mkdir -p /root/.config/rclone/
wget "https://raw.githubusercontent.com/thinhplust/jdownloads/main/rclone.conf" -O /root/.config/rclone/rclone.conf
echo "-----> Gclone Config successfully"

echo "-----> Install Tmux"
apt install tmux
echo "-----> Tmux installed successfully"
gclone --version
echo "----> Install Crontab, Auto move File"
apt install cron -y
apt install nano -y
apt install nload -y
apt install htop -y
apt install zip -y
add-apt-repository ppa:linuxuprising/java -y
apt install openjdk-11-jre-headless -y
mkdir /JDownloader
cd /JDownloader
wget http://installer.jdownloader.org/JDownloader.jar
mkdir /root/logs
touch /root/logs/gclone-upload.log
wget https://raw.githubusercontent.com/thinhplust/jdownloads/main/rclone-upload.sh
chmod a+x rclone-upload.sh
crontab -l | { cat; echo "* * * * * /root/rclone-upload.sh >/dev/null 2>&1"; } | crontab -
/etc/init.d/cron start
/etc/init.d/cron status
echo "------> Crontab configured successfully"

sudo apt install qbittorrent-nox

echo "-----> Install qbittorrent-nox"
wget https://raw.githubusercontent.com/thinhplust/sa/main/qbit.service
mv qbit.service /etc/systemd/system/
chmod +x /etc/systemd/system/qbit.service
wget https://raw.githubusercontent.com/thinhplust/sa/main/qbit.timer
mv qbit.timer /etc/systemd/system/
chmod +x /etc/systemd/system/qbit.timer

systemctl enable qbit.timer

sudo adduser --system --group qbittorrent-nox

sudo adduser root qbittorrent-nox

