#!/bin/bash
source /root/ArchTitus/setup.conf

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERNAME}|g" @

cp -v -r dotfiles-openbox/. /home/${USERNAME}

cd /home/${USERNAME}/.icons/
tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz
rm -r *.xz
mv * /usr/share/icons/

fc-cache -rv

# Clean up the mess
cd /home/${USERNAME}
rm -rf README.md LICENSE .git install.sh
rm -rf /dotfiles-openbox

sudo gpasswd -a ${USERNAME} video
sudo chown -R ${USERNAME}:${USERNAME} /home/$USERNAME/.
