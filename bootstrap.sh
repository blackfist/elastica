#!/usr/bin/env bash

echo "Adding elasticsearch GPG key to apt"
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo "Adding osquery GPG key"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9D8B80B

echo "Adding logstash GPG key"
wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo "Adding repository for java, logstash, osquery, and elasticsearch"
add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
add-apt-repository "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
add-apt-repository ppa:webupd8team/java
add-apt-repository "deb https://osquery-packages.s3.amazonaws.com/trusty trusty main"

echo "Installing elasticsearch, java, logstash, and osquery"
apt-get update
apt-get install -y openjdk-7-jre elasticsearch logstash osquery
update-rc.d elasticsearch defaults 95 10
update-rc.d osqueryd defaults 95 10
update-rc.d logstash defaults 95 10

echo "Configuring and starting elasticsearch"
cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
/etc/init.d/elasticsearch start

echo "Configuring osqueryd"
cp /vagrant/osquery.conf /etc/osquery/osquery.conf
/etc/init.d/osqueryd start

echo "Configuring logstash"
cp /vagrant/logstash.conf /etc/logstash/conf.d/logstash.conf
/etc/init.d/logstash start
