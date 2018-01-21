pushd ~
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# download an install rvm
\curl -sSL https://get.rvm.io | bash

# load RVM
source ~/.rvm/scripts/rvm

# install ruuby
rvm install ruby-1.9.3-p551

popd

# install mysql dev
sudo apt-get install libmysqlclient-dev

# nokogiri
sudo apt-get install libxslt-dev libxml2-dev zlib1g-dev

# imagemagick
sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev

# Needed for Ubuntu 16
# sudo ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config /usr/bin/Magick-config

