#!/bin/bash
source ~/ArchTitus/setup.conf

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERNAME}|g" @

cp -v -r dotfiles-openbox/. ~/

cd .icons
cat oomox* | tar -Jxvf - -i
rm -r /*.xz
sudo mv /oomox-aesthetic* /usr/share/icons/

fc-cache -rv

cd ~
# Clean up the mess
rm -rf README.md LICENSE .git install.sh install-titus.sh dotfiles-openbox

sudo gpasswd -a ${USERNAME} video
