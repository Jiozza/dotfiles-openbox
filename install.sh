#!/bin/bash

cd ..
grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USER}|g" @

cp -v -r dotfiles-openbox/. ~

tar -Jxvf ./icons/oomox-aesthetic*
rm -r *.xz
sudo mv oomox-aesthetic* /usr/share/icons/

fc-cache -rv

# Clean up the mess
rm -rf README.md LICENSE .git install.sh install-titus.sh dotfiles-openbox

sudo gpasswd -a ${USER} video
