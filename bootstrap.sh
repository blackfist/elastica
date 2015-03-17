#!/usr/bin/env bash

echo "Adding elasticsearch GPG key to apt"
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo "Adding repository for java and elasticsearch"
add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
add-apt-repository ppa:webupd8team/java

echo "Installing elasticsearch"
apt-get update
apt-get install -y openjdk-7-jre elasticsearch
update-rc.d elasticsearch defaults 95 10

echo "Configuring and starting elasticsearch"
cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
/etc/init.d/elasticsearch start
