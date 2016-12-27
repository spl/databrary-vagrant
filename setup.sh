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
apt-get -y upgrade

# Install new packages.
apt-get -y install \
  alex-3.1.7 \
  cabal-install-1.24 \
  ghc-7.10.3 \
  happy-1.19.5 \
  libfdk-aac-dev \
  libmp3lame-dev \
  libpam-cracklib \
  nodejs \
  oracle-java8-installer \
  postgresql \
  yasm \

curl https://www-us.apache.org/dist/lucene/solr/6.3.0/solr-6.3.0.tgz | tar xzf -  # US
#curl http://apache.is.co.za/lucene/solr/6.3.0/solr-6.3.0.tgz | tar xzf -          # SA
ln -s $PWD/solr-6.3.0/bin/solr /usr/local/bin/solr

# Checkout and build x264
git clone --depth 1 --single-branch --branch stable git://git.videolan.org/git/x264.git x264
(cd x264 && ./configure --enable-shared && make install)

# Checkout and build ffmpeg. Using the GitHub mirror since the main repository
# was giving errors.
git clone --depth 1 --single-branch --branch n2.8.10 https://github.com/FFmpeg/FFmpeg.git ffmpeg
(cd ffmpeg && ./configure --disable-runtime-cpudetect --enable-shared --enable-gpl --enable-version3 --enable-nonfree --enable-libx264 --enable-libfdk-aac --enable-libmp3lame && make install)

su -c "source /vagrant/user-config.sh" vagrant
