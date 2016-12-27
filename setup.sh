#!/usr/bin/env bash

# Add PPA repositories.
add-apt-repository -y ppa:hvr/ghc               # alex, cabal, ghc, happy
add-apt-repository -y ppa:webupd8team/java      # java

# Tell the oracle-java8-installer that you accept the license agreement.
# Otherwise, it will open a curses window that requires typing Enter.
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | \
  sudo /usr/bin/debconf-set-selections

# Prepare for installing Node.JS. This also runs `apt-get update`, which should
# happen before running the `upgrade` and `install` commands.
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

# Upgrade existing packages.
apt-get upgrade -y

# Install new packages.
apt-get install -y \
  alex-3.1.7 \
  cabal-install-1.24 \
  ghc-7.10.3 \
  lame \
  libfdk-aac-dev \
  libpam-cracklib \
  nodejs \
  oracle-java8-installer \
  oracle-java8-set-default \
  postgresql \

curl https://www-us.apache.org/dist/lucene/solr/6.3.0/solr-6.3.0.tgz | tar xzf -  # US
#curl http://apache.is.co.za/lucene/solr/6.3.0/solr-6.3.0.tgz | tar xzf -          # SA

#git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
#git clone -b stable git://git.videolan.org/git/x264.git x264
