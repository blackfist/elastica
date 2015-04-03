#!/usr/bin/env bash

echo "Adding elasticsearch GPG key to apt"
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo "Adding osquery GPG key"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9D8B80B

echo "Adding repository for java and elasticsearch"
add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
add-apt-repository ppa:webupd8team/java

echo "Adding repository for osquery"
add-apt-repository "deb https://osquery-packages.s3.amazonaws.com/trusty trusty main"

echo "Installing elasticsearch, java, and osquery"
apt-get update
apt-get install -y openjdk-7-jre elasticsearch osquery
update-rc.d elasticsearch defaults 95 10

echo "Configuring and starting elasticsearch"
cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
/etc/init.d/elasticsearch start

echo "Configuring osqueryd"
cp /vagrant/osquery.conf /etc/osquery/osquery.conf
