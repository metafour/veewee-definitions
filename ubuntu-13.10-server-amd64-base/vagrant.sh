mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

run () {
  echo "*** $1"
  su -l -c "$1" vagrant
}

run "git clone https://github.com/metafour/dotfiles ~/.dotfiles"
run "cd ~/.dotfiles && ./setup.sh"
run "cd ~/.dotfiles && ./ohmyzsh.sh"
run "cd ~/.dotfiles && ./vimsetup.sh"
run "echo 'vagrant' | chsh -s /usr/bin/zsh"
