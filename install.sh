#!/bin/bash

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERNAME}|g" @

cp -v -r dotfiles-openbox/. /home/${USER}

cd /home/${USER}/.icons/
tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz
rm -r *.xz
sudo mv * /usr/share/icons/

fc-cache -rv

# Clean up the mess
cd /home/${USER}
rm -rf README.md LICENSE .git install.sh install-titus.sh dotfiles-openbox

sudo gpasswd -a ${USER} video
