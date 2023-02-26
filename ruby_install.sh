# onliner usage:
# bash <(curl -s https://gist.githubusercontent.com/makevoid/2be2170f17801c761aadfe7d9978b003/raw/0fd04b699b5ef461205f0e0ca831bc60b3b72a98/install-ruby-3-debian.sh)

set -xe 

apt update -y

apt install -y build-essential git redis-server cmake vim wget curl libsqlite3-dev python apt-transport-https ca-certificates automake libtool libzlcore-dev libyaml-dev openssl libssl-dev zlib1g-dev libreadline-dev libcurl4-openssl-dev software-properties-common libreadline6-dev

mkdir -p ~/tmp

cd ~/tmp 

wget https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.3.tar.xz

tar -xvf ruby-3.0.3.tar.xz

cd ruby-3.0.3/

./configure

make

make install

gem i -N bundler 
