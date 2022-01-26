#!/bin/bash
source ~/ArchTitus/setup.conf

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERNAME}|g" @

cp -v -r dotfiles-openbox/. ~/

tar -Jxvf .icons/oomox-aesthetic*
rm -r .icons/*.xz
sudo mv .icons/. /usr/share/icons/

fc-cache -rv

# Clean up the mess
rm -rf README.md LICENSE .git install.sh install-titus.sh dotfiles-openbox

sudo gpasswd -a ${USERNAME} video
