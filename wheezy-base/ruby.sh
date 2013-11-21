# Install Ruby from packages
#apt-get -y install ruby ruby-dev libopenssl-ruby1.8 irb ri rdoc

# Install Rubygems from source
#rg_ver=1.8.22
#curl -o /tmp/rubygems-${rg_ver}.zip \
#  "http://production.cf.rubygems.org/rubygems/rubygems-${rg_ver}.zip"
#(cd /tmp && unzip rubygems-${rg_ver}.zip && \
#  cd rubygems-${rg_ver} && ruby setup.rb --no-format-executable)
#rm -rf /tmp/rubygems-${rg_ver} /tmp/rubygems-${rg_ver}.zip

run() {
  echo "*** $1"
  su -l -c "$1" vagrant
}

run "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
run "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
