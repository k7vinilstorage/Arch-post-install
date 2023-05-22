echo "k7vinilstorage -- Arch-post-install"

#System updates + yay + wget
echo "Updating System"

sudo pacman -Syu --noconfirm

echo "Installing yay"

sudo pacman -S --needed git base-devel --noconfirm && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
cd ~/

#Bluetooth toools + audio formware
echo "Installing audio formware and bluetooth"

sudo pacman -S sof-firmware alsa-firmware bluez bluez-libs --noconfirm

#Install apps

echo "apps"

sudo pacman -S code gnome-boxes gparted zsh discord fuse gcc gdb os-prober cifs-utils neofetch --noconfirm
yay -S google-chrome code-marketplace update-grub gdm-settings touchegg --noconfirm

echo "--enable-features=WebUIDarkMode" >> ~/.config/chrome-flags.conf
echo "--force-dark-mode" >> ~/.config/chrome-flags.conf

#Grub
echo "now enable OS prober"
sleep 5s
sudo nano /etc/default/grub


git clone https://github.com/k7vinilstorage/Arch-Grub.git
cd Arch-Grub
cd xenlism-grub-arch-1080p
sudo sh install.sh
cd ~/
rm -rf Arch-Grub

#themes

git clone https://github.com/k7vinilstorage/Arch-Sur.git
git clone https://github.com/k7vinilstorage/ArchSur-icon.git
git clone https://github.com/k7vinilstorage/ArchSur-cursors.git

#Shell
cd Arch-Sur
./install.sh -n ArchSur -t orange -p 30 -s 180 -i arch -m -l -HD --round --darker
cd ~/
rm -rf Arch-Sur

cd ArchSur-icon
./install.sh -n ArchSur -t orange
cd ~/
rm -rf ArchSur-icon

cd ArchSur-cursors
./install.sh -n ArchSur
cd ~/
rm -rf ArchSur-cursors

#terminal

git clone https://github.com/k7vinilstorage/Arch-fonts.git --depth=1
cd Arch-fonts
./install.sh
cd ..
rm -rf Arch-fonts

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

wget -O ~/.oh-my-zsh/custom/themes/pi.zsh-theme https://raw.githubusercontent.com/k7vinilstorage/Arch-zsh-theme/master/pi.zsh-theme

echo "alias yay-clean='yay -Sc && yay -Qtdq | yay -Rns -'" >> ~/.zshrc
echo "alias x11-tp='sudo systemctl start touchegg'" >> ~/.zshrc

echo "Now enable pi theme"
sleep 5s
nano ~/.zshrc

sudo pacman -Rns gnome-contacts gnome-weather gnome-clocks htop cheese gnome-maps epiphany vim --noconfirm

sudo cp -r ~/.themes/* /usr/share/themes
sudo cp -r ~/.local/share/icons/* /usr/share/icons

neofetch
sleep 3s

echo "Now configure GDM and intall extensions"
echo "Blur my shell, Caffeine"
echo "Clipboard History, Dash to dock"
echo "GSConnect, Quick Settings Audio Panel"
echo "Tray Icons Reloaded, X11 gestures"
