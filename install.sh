#!/bin/bash
source /root/ArchTitus/setup.conf

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERNAME}|g" @

cp -v -r {.*,*} /home/${USERNAME}/

rm /home/${USERNAME}/README.md && rm /home/${USERNAME}/LICENSE && rm -rf /home/${USERNAME}/.git

cd /home/${USERNAME}/.icons/
tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz
rm -r *.xz
mv * /usr/share/icons/

fc-cache -rv

sudo gpasswd -a ${USERNAME} video
