#!/bin/bash

cd ..
grep -rl 'iruha' dotfiles-openbox/ | xargs -i@ sed -i "s|iruha|$USER|g" @

pushd dotfiles-openbox/ && \
  bash -c 'cp -v -r {.*,*} /home/$USERNAME/' && \
popd

rm /home/$USERNAME/README.md && rm /home/$USERNAME/LICENSE && rm -rf /home/$USERNAME/.git

cd /home/$USERNAME/.icons/
tar -Jxvf oomox-aesthetic-light.tar.xz && tar -Jxvf oomox-aesthetic-dark.tar.xz
sudo cp -r {oomox-aesthetic-light,oomox-aesthetic-dark} /usr/share/icons/
rm -r /home/$USERNAME/.icons/{oomox-aesthetic-light,oomox-aesthetic-dark,*.tar.xz} # Delete unnecessary files

fc-cache -rv

sudo gpasswd -a $USER video
