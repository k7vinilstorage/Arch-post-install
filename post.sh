echo "k7vinilstorage -- Arch-post-install"

#System updates + yay + wget
echo "Updating System"

sudo pacman -Syu

echo "Installing yay"

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ~/

#Bluetooth toools + audio formware
echo "Installing audio formware and bluetooth"

sudo pacman -S sof-firmware alsa-firmware bluez bluezlibs

#Install apps

echo "apps"

pacman -S code gnome-boxes gparted zsh discord fuse gcc gdb os-prober cifs-utils neofetch
yay -S google-chrome code-marketplace update grub

echo "--enable-features=WebUIDarkMode" >> ~/.config/{chrome,chromium}-flags.conf
echo "--force-dark-mode" >> ~/.config/{chrome,chromium}-flags.conf

#Grub

sudo su
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
exit

git clone https://github.com/k7vinilstorage/Arch-Grub.git
cd Arch-Grub
cd xenlism-grub-arch-1080p
sudo sh install.sh
cd ~/

#themes

git clone https://github.com/k7vinilstorage/Arch-Sur.git
git clone https://github.com/k7vinilstorage/ArchSur-icon.git
git clone https://github.com/k7vinilstorage/ArchSur-cursors.git

#Shell
cd Arch-Sur
./install.sh -n ArchSur -t orange -p 30 -s 180 -i arch -m -l -HD --round --darker
cd ~/

cd ArchSur-icon
./install.sh -n ArchSur -t orange
cd ~/

cd ArchSur-cursors
./install.sh
cd ~/

#terminal

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

mkdir $ZSH_CUSTOM/themes
wget -O $ZSH_CUSTOM/themes/pi.zsh-theme https://raw.githubusercontent.com/tobyjamesthomas/pi/master/pi.zsh-theme
nano ~/.zshrc

















