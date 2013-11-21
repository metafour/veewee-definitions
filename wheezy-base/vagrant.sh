# Set up Vagrant.

run() {
  echo "*** $1"
  su -l -c "$1" vagrant
}

date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
#useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /usr/bin/zsh -N vagrant

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Customize vagrant user configuration
run "git clone https://github.com/metafour/dotfiles ~/.dotfiles"
run "cd ~/.dotfiles && ./setup.sh"
run "cd ~/.dotfiles && ./ohmyzsh.sh"
run "cd ~/.dotfiles && ./vimsetup.sh"
run "echo 'vagrant' | chsh -s /usr/bin/zsh"

# Customize the message of the day
echo 'Welcome to wheezy-base' > /var/run/motd

# Install NFS client
#apt-get -y install nfs-common


