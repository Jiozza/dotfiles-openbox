#!/bin/bash

grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|${USERN}|g" @

pushd dotfiles-openbox/ && \
  bash -c 'cp -v -r {.*,*} /home/${USERN}/' && \
popd

rm /home/${USERN}/README.md && rm /home/${USERN}/LICENSE && rm -rf /home/${USERN}/.git

cd /home/${USERN}/.icons/
tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz
sudo cp -r {oomox-aesthetic-light,oomox-aesthetic-dark} /usr/share/icons/
rm -r /home/${USERN}/.icons/{oomox-aesthetic-light,oomox-aesthetic-dark,*.tar.xz} # Delete unnecessary files

fc-cache -rv

sudo gpasswd -a ${USERN} video
